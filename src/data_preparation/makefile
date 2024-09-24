DATA = ../../data
DP = ../../src/data_preparation
INPUT = ../../gen/data_preparation

all: $(DATA)/dataset_dprep.csv $(INPUT)/weekly_baskets.csv


$(INPUT)/weekly_baskets.csv: $(DP)/data_cleaning.R
	R --vanilla < $(DP)/data_cleaning.R

$(DATA)/dataset_dprep.csv: $(DP)/download_data.R
	R --vanilla < $(DP)/download_data.R