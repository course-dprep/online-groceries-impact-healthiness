# set wd to home as basis for project storage
setwd("~")

# create directory to save project
dir.create("./dprep-project-team-14")
setwd("./dprep-project-team-14")

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
