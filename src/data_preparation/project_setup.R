# creating directory for project

# set wd to home as basis for project storage
setwd("~")

# create directory to save project
dir.create("./online-groceries-impact-healthiness")
setwd("./online-groceries-impact-healthiness")

# create sub-directories
dir.create("data")
dir.create("gen")
dir.create("gen/data-preparation")
dir.create("gen/analysis")
dir.create("gen/paper")
dir.create("src")
dir.create("src/data-preparation")
dir.create("src/analysis")
dir.create("src/paper")

setwd("~")

# installing and loading required R packages

required_packages <- c("data.table", "dplyr", "xtable", "tinytex", "ggplot2")

# Install missing packages
installed_packages <- rownames(installed.packages())
for (pkg in required_packages) {
  if (!pkg %in% installed_packages) 
    {install.packages(pkg, dependencies = TRUE)}
}

# Load the packages
lapply(required_packages, library, character.only = TRUE)

rm(pkg, installed_packages, required_packages)

