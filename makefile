all: data-preparation analysis

data_preparation:
	-C src/data_preparation

analysis:
	make -C src/analysis