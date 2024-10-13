all: data_preparation analysis paper

paper: 
	make -C src/paper

data_preparation:
	make -C src/data_preparation

analysis:
	make -C src/analysis

clean:
	R -e "unlink('data', recursive = TRUE)"
	R -e "unlink('gen', recursive = TRUE)"
