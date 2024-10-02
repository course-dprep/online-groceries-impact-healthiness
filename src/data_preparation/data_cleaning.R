# load packages
library(data.table)
library(dplyr)

# create directory to store output
dir.create("../../gen/data_preparation/input", recursive = TRUE)

purchases_2019 <- fread("../../data/dataset_dprep.csv")

# remove irrelevant variables
purchases_2019[, c("Promo", "PL", "Volume_per_unit",  "BG_Category_number") := NULL]

# change variables names
purchases_2019 <- setnames(purchases_2019, 
               old = c("Date_of_purchase", "Total_unit_sales", "Total_value_sales", "Total_volume_sales", 
                       "Panelist", "Barcode", "Retailer", "Brand", "Measurement_unit", "segment", "channel"),
               new = c("date", "units", "value", "volume", "panelist", "barcode", "retailer", "brand", 
                       "measurement_unit", "segment", "channel"))


# create structure in columns for overview
setcolorder(purchases_2019, c("panelist", "date", "retailer", "barcode", "brand", "segment", "channel", "units", "value", "volume", "measurement_unit") )


# week_number variable
start_date <- as.Date("2019-01-01") # observation begins on tuesday 01-01-2019
start_date <- start_date - (wday(start_date) - 2) # start week 1 on a Monday

purchases_2019 <- purchases_2019[, week_number := as.integer(difftime(date, start_date, units = "weeks") + 1)]

# identify online shoppers (at least online once)
purchases_2019[, number_online_trips := uniqueN(date[channel == "online"]), by = panelist]
purchases_2019[, shopper_type := fifelse(number_online_trips == 0, 0, 1), by = panelist]

purchases_2019[, first_purchase_week := min(week_number), by = panelist]
purchases_2019[, last_purchase_week := max(week_number), by = panelist]
purchases_2019[, first_online_week := fifelse(shopper_type ==1, min(week_number[channel == "online"]), 0), by = panelist]

# filter at least 4 weeks of data before & after online adoption moment
adopters <- purchases_2019[shopper_type == 1]

adopters <- adopters %>%
  group_by(panelist) %>%
  mutate(
    weeks_before_adoption = first_online_week - first_purchase_week,
    weeks_after_adoption = last_purchase_week - first_online_week + 1) %>%
  ungroup()

adopters <- adopters %>% filter(weeks_before_adoption >= 4 & weeks_after_adoption >= 4)

#filter online shoppers in purchases_2019
purchases_2019 <- purchases_2019[panelist %in% adopters$panelist | shopper_type == 0]

# create clean dataset
fwrite(purchases_2019, "../../gen/data_preparation/input/data_clean.csv")