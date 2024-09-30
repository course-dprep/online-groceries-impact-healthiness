# load packages
library(data.table)
library(dplyr)

# open data
DT <- fread("../../gen/data_preparation/input/data_clean.csv")

# weekly basket aggregation
weekly_baskets <- setDT(DT %>% group_by(panelist, week_number) %>%
                  summarise(
                    treatment_group = first(shopper_type),
                    cohort_period = first(first_online_week),
                    prop_expenditure_vegetables = sum(value[segment == c("groente", "fruit")]) / sum(value) * 100) %>%
                  ungroup() )

fwrite(weekly_baskets, "../../gen/data_preparation/input/weekly_baskets.csv")    