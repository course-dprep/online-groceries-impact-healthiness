# load packages
library(data.table)
library(dplyr)

# create directory to store output
dir.create("../../gen/data_preparation/input", recursive = TRUE)

DT <- fread("../../data/dataset_dprep.csv")

# remove irrelevant variables
DT[, c("Promo", "PL", "Volume_per_unit",  "BG_Category_number") := NULL]

# change variables names
DT <- setnames(DT, 
               old = c("Date_of_purchase", "Total_unit_sales", "Total_value_sales", "Total_volume_sales", 
                       "Panelist", "Barcode", "Retailer", "Brand", "Measurement_unit", "segment", "channel"),
               new = c("date", "units", "value", "volume", "panelist", "barcode", "retailer", "brand", 
                       "measurement_unit", "segment", "channel"))


# create structure in columns for overview
setcolorder(DT, c("panelist", "date", "retailer", "barcode", "brand", "segment", "channel", "units", "value", "volume", "measurement_unit") )


# week_number variable
start_date <- as.Date("2019-01-01") # observation begins on tuesday 01-01-2019
start_date <- start_date - (wday(start_date) - 2) # start week 1 on a Monday

DT <- DT[, week_number := as.integer(difftime(date, start_date, units = "weeks") + 1)]

# identify online shoppers (at least online once)
DT[, number_online_trips := uniqueN(date[channel == "online"]), by = panelist]
DT[, shopper_type := fifelse(number_online_trips == 0, 0, 1), by = panelist]

DT[, first_purchase_week := min(week_number), by = panelist]
DT[, last_purchase_week := max(week_number), by = panelist]
DT[, first_online_week := fifelse(shopper_type ==1, min(week_number[channel == "online"]), 0), by = panelist]

# filter at least 4 weeks of data before & after online adoption moment
adopters <- DT[shopper_type == 1]

adopters <- adopters %>%
  group_by(panelist) %>%
  mutate(
    weeks_before_adoption = first_online_week - first_purchase_week,
    weeks_after_adoption = last_purchase_week - first_online_week + 1) %>%
  ungroup()

adopters <- adopters %>% filter(weeks_before_adoption >= 4 & weeks_after_adoption >= 4)

#filter online shoppers in DT
DT <- DT[panelist %in% adopters$panelist | shopper_type == 0]

# create clean dataset
fwrite(DT, "../../gen/data_preparation/input/data_clean.csv")