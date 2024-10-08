# Define paths
SCA = ../../src/analysis/
GA = ../../gen/analysis/
GP = ../../gen/paper/

all: $(GA)did_effects_list.rds $(GP)ATT_table.pdf $(GP)results_plots.pdf


$(GA)did_effects_list.rds: $(SCA)analysis.R
	R --vanilla < $(SCA)analysis.R


$(GP)ATT_table.pdf: $(SCA)model_summaries.R
	R --vanilla < $(SCA)model_summaries.R

$(GP)results_plots.pdf$(SCA)model_summaries.R
	R --vanilla < $(SCA)model_summaries.R
