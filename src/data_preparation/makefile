DATA=../../data
DP=../../src/data_preparation

all: $(DATA)/dataset_dprep.csv 

$(DATA)/dataset_dprep.csv: $(DP)/download_data.R
	R --vanilla < $(DP)/download_data.R