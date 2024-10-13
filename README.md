# The Impact of Online Grocery Shopping (OGS) on the Healthiness of Households’ Food Purchases

*Note: the final product of this project ("final_product.pdf") can be found in the gen/paper directory after running the makefile* 
## Motivation

The demand for healthier food consumption has increased significantly in recent years. Recent literature has investigated how the healthiness of online grocery purchases differs from offline (in-store) purchases (Chintala et al, 2024; Harris-Lagoudakis, 2022; Huyghe et al, 2017).
While online grocerybaskets tend to be healthier compared to offline baskets, it is unclear if the adoption of OGS contributes to
healthier consumption or if it results in a redistribution across channels, where consumers simply shift the
more healthy purchases online and purchase unhealthy products mainly offline. 

The central question in this project follows:

*How does the transition to hybrid grocery shopping affect the healthiness of food purchases across both online and offline grocery channels?*

## Method & Results

This study uses real world panel purchase data of households across a set of supermarket retailers. The dataset contains purchase data of 150 unique households in the Netherlands in 2019. These households made over 180.000 individual product purchases across 26 different retailers. 
The table below provides an overview of the relevant variables in the dataset. To answer the research question, I employ a Difference-in-Difference (DiD) approach proposed by Sant'Anna & Callaway (2021). This method allows for dealing with staggered adoption and is employed to analyse the changes in the healthiness of weekly grocery purchases for households that transition to
hybrid shopping against those that continue shopping exclusively offline. The healthiness of grocery purchases is measured as the proportion of expenditure that is spent on the healthy food categories fruits and vegetables.

The results of this study are presented in three main parts: (i) an overall effect, represented as a weighted average across each cohort; (ii) an individual cohort analysis to examine differences across adoption weeks and households; and (iii) a time-window analysis that investigates changes in patterns within an 8-week period before and after adoption. 
However, the analysis revealed no statistically significant findings, which limits my ability to draw conclusions regarding changes in the healthiness of grocery purchases after adopting online shopping channels.


| Variable            | Description                                                    |
|---------------------|----------------------------------------------------------------|
| Panelist            | Unique identifier for each household                           |
| Date		      | Date on which the purchase was made                            |
| Barcode             | Barcode of the product purchased                               |
| Retailer            | Identifier for the supermarket where the purchase was made     |
| Brand               | The brand of the product                                       |
| Units		      | Total units of the product sold                                |
| Value		      | Total value of the sales for the product (in Euro cents)       |
| Volume	      | Total volume of the product sold                               |
| Channel	      | Method of purchase (offline or online)                         |
| Measurement unit    | The unit at which the volume of a product is measured          |
| Segment             | A category indicator to identify product groups    	       |




## Repository overview
- README.md
- src:  all source codes used for data manipulation.
  * analysis
	* analysis.R
	* makefile
	* model_summaries.R
  * data_preparation
	* data_cleaning.R
	* data_exploration.pdf
	* data_exploration.Rmd
	* download_data.R
	* install_packages.R
	* makefile
	* weekly_aggregation.R
  * paper
	* final_product.Rmd
	* makefile
 - .gitignore
 - makefile


## Dependencies

This project uses R as a tool for data analysis and printing of results tables and graphs. Please follow the installation guide on Tilburg Science Hub to install R and RStudio by clicking on the following [link](https://tilburgsciencehub.com/topics/computer-setup/software-installation/rstudio/r/).

To manipuate and analyse the data, this project makes use of several packages within R. These packages will be automatically installed (if not installed already) when running the full source code. The packages that are used are:
* data.table
* dplyr
* xtable
* tinytex
* ggplot2
* did
* kableExtra
* knitr
  

## Running instructions
To run the code, please folllow these instructions:
1. Use the command line / terminal (or Git Bash) to clone the repository onto your local PC using the following code:

```
git clone https://github.com/course-dprep/online-groceries-impact-healthiness
```
2. Set your working directory to 'online-groceries-impact-healthiness' and run the following command:

```
make
```
3. Running the makefile will run all makefiles needed to perform the analysis and generate results.
4. The final product of this project takes form of a pdf file named "final_product.pdf" and is stored in the gen/paper directory.


## Data Preparation & Workflow Management - Team 14 
* Melle Klein Goldewijk (m.kleingoldewijk@tilburguniversity.edu)
