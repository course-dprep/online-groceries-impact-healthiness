SCP = ../../src/paper/
GP = ../../gen/paper/

all: $(GP)final_product.pdf

$(GP)final_product.pdf: $(SCP)final_product.Rmd
	Rscript -e "rmarkdown::render('$(SCP)final_product.Rmd', output_dir = '$(GP)')"
