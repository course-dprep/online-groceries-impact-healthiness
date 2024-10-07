# load packages
library(data.table)
library(dplyr)

# open data
purchases_2019 <- fread("../../gen/data_preparation/input/data_clean.csv")

# weekly basket aggregation
weekly_baskets_2019 <- setDT(purchases_2019 %>% group_by(panelist, week_number) %>%
                  summarise(
                    treatment_group = first(shopper_type),
                    cohort_period = first(first_online_week),
                    prop_expenditure_fruit_vegetables = sum(value[segment %in% c("groente", "fruit")]) / sum(value) * 100) %>%
                  ungroup() )

fwrite(weekly_baskets_2019, "../../gen/data_preparation/input/weekly_baskets_2019.csv")    
