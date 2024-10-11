# Set CRAN mirror
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# installing required R packages

required_packages <- c("data.table", "dplyr", "xtable", "tinytex", "ggplot2", "did", "kableExtra")

# Install missing packages
installed_packages <- rownames(installed.packages())
for (pkg in required_packages) {
  if (!pkg %in% installed_packages) 
    {install.packages(pkg, dependencies = TRUE)}}
