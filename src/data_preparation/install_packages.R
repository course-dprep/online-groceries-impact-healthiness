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

