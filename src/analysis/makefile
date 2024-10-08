SCA = ../../src/analysis
GA = ../../gen/analysis
GP = ../../gen/paper

all: $(GA)did_effects_list.rds $(GP)Results_and_Conclusion


$(GA)did_effects_list.rds: $(SCA)analysis.R
	R --vanilla < $(SCA)analysis.R

$(GP)Results & Conclusion: $(SCA)model_results.Rmd
	Rscript -e "rmarkdown::render("model_results.Rmd", output_file = "Results_and_Conclusion", output_format = "pdf_document", output_dir = "../../gen/paper")"
	