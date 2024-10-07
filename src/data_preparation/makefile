DATA = ../../data
INPUT = ../../gen/data_preparation/input
DP = .


all: $(DATA)/dataset_dprep.csv $(INPUT)/weekly_baskets.csv


$(INPUT)/weekly_baskets.csv: $(INPUT)/data_clean.csv $(DP)/weekly_aggregation.R
	R --vanilla < $(DP)/weekly_aggregation.R

$(INPUT)/data_clean.csv: $(DATA)/dataset_dprep.csv $(DP)/data_cleaning.R
	R --vanilla < $(DP)/data_cleaning.R

$(DATA)/dataset_dprep.csv: $(DP)/download_data.R 
	R --vanilla < $(DP)/download_data.R

$(DP)/install_packages.R: $(DP)/install_packages.R
	R --vanilla < $(DP)/install_packages.R