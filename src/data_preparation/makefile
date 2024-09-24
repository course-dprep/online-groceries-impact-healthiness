DATA = ../../data
DP = ../../src/data_preparation
INPUT = ../../gen/data_preparation/input
TEMP = ../../gen/data_preparation/temp

all: $(DATA)/dataset_dprep.csv $(INPUT)/weekly_baskets.csv


$(INPUT)/weekly_baskets.csv: $(DP)/weekly_aggregation.R
	R --vanilla < $(DP)/weekly_aggregation.R

$(INPUT)/data_clean.csv: $(DP)/data_cleaning.R
	R --vanilla < $(DP)/data_cleaning.R)

$(DATA)/dataset_dprep.csv: $(DP)/download_data.R 
	R --vanilla < $(DP)/download_data.R

$(DP)/install_packages.R: $(DP)/install_packages.R
		R --vanilla < $(DP)/install.packages.R
