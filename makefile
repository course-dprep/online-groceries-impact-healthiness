all: data_preparation analysis

data_preparation:
	make -C src/data_preparation

analysis:
	make -c src/analysis

clean:
	R -e "unlink('data', recursive = TRUE)"
	R -e "unlink('gen', recursive = TRUE)"
