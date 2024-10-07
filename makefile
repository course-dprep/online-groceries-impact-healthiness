all: data_preparation

data_preparation:
	make -C src/data_preparation


clean:
    R -e "unlink('data', recursive = TRUE)"
    R -e "unlink('gen', recursive = TRUE)"
