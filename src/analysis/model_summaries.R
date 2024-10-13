# Load required packages
library(data.table)
library(ggplot2)
library(kableExtra)
library(did)

# create directory for output
dir.create("../../gen/paper")

# Load and extract data
results_list <- readRDS("../../gen/analysis/did_effects_list.rds")

average_did_effect <- results_list$average_did_effect
time_window_effects <- results_list$time_window_effects
cohort_effects <- results_list$cohort_effects


# create table for average effect
average_effect_df <- data.frame(
  ATT = average_did_effect$overall.att,
  Std_Error = average_did_effect$overall.se,
  CI_Lower = average_did_effect$overall.att - 1.96 * average_did_effect$overall.se,
  CI_Upper = average_did_effect$overall.att + 1.96 * average_did_effect$overall.se)

average_effect_df <- round(average_effect_df, 3)

ATT_table <- kable(average_effect_df, caption = "Average Treatment Effect (ATT)") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"))

# create 8-week time window plot
time_window_plot <- ggdid(time_window_effects)

# Modify the title
time_window_plot <- time_window_plot + 
  ggtitle("Figure 1. Event study plot of Average Treatment Effect (ATT) over time")



# create individual cohort effect plot
cohort_plot <- ggdid(cohort_effects)

# Modify the title
cohort_plot <- cohort_plot + 
  ggtitle("Figure 2. Average Treatment Effect (ATT) per cohort (adoption-week")




# Open a PDF device for results
pdf(file = "../../gen/paper/ATT_table.pdf")

gridExtra::grid.table(average_effect_df, rows = NULL)

dev.off()

# Open a new PDF device for plots
pdf(file = "../../gen/paper/time_window_plot.pdf") 

# Render the time window plot
print(time_window_plot, width = 6, height = 3)

dev.off()


# Open a new PDF device for plots
pdf(file = "../../gen/paper/cohort_plot.pdf") 

# Render the cohort plot
print(cohort_plot, width = 5, height = 2)

# Close the PDF device for plots
dev.off()


