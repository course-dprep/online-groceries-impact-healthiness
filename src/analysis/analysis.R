# load required packages
library(data.table)
library(did)



# directory creation for analysis output
dir.create("../../gen/analysis/")


# load in dataset
weekly_baskets_2019 <- fread("../../gen/data_preparation/input/weekly_baskets_2019.csv")


# difference-in-differences analysis method from Callaway & Sant'Anna (2021) using did package

# method required a treated indicator 
weekly_baskets_2019[, treated := ifelse(treatment_group == 1 & week_number >= cohort_period, 1, 0)]
weekly_baskets_2019[, panelist_numeric := as.numeric(factor(weekly_baskets_2019$panelist, levels = unique(weekly_baskets_2019$panelist)))]

# run did model
did_model <- att_gt(yname = "prop_expenditure_fruit_vegetables",
                tname = "week_number",
                idname = "panelist_numeric",
                gname = "cohort_period",
                control_group = "nevertreated",
                xformla = ~1,
                data = weekly_baskets_2019,
                allow_unbalanced_panel = TRUE,
                clustervars = "panelist")

# create result plots & tables

# average results of model
average_did_effect  <- aggte(did_model, type = "simple", na.rm = TRUE)


# confidence interval 8-week time window around online adoption
time_window_effects <- aggte(
  did_model,
  type = "dynamic",
  min_e = -8,  max_e = 8, na.rm = TRUE)


# effects per cohort
cohort_effects <- aggte(did_model, type = "group", na.rm = TRUE)

results_list <- list(
  average_did_effect = average_did_effect,
  time_window_effects = time_window_effects,
  cohort_effects = cohort_effects)

saveRDS(results_list, file = "../../gen/analysis/did_effects_list.rds")
