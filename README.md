# The Impact of Online Grocery Shopping (OGS) on the Healthiness of Households’ Food Purchases

## Research motivation

The demand for healthier food consumption has increased significantly in recent years. For many households, supermarket retailers are still the primary source for their food purchases. By shaping the environment in
which purchasing decisions are made, retailers play a crucial role in the forming of consumers’ food purchasing
behavior and habits. Recent literature has investigated how the healthiness of online grocery purchases differs from offline (in-store) purchases (Chintala et al, 2024; Harris-Lagoudakis, 2022; Huyghe et al, 2017).
While online grocerybaskets tend to be healthier compared to offline baskets, it is unclear if the adoption of OGS contributes to
healthier consumption or if it results in a redistribution across channels, where consumers simply shift the
more healthy purchases online and purchase unhealthy products mainly offline. More research is needed that
examines how households alternate between online and offline shopping trips and how they allocate their
purchases across both channels. As such, the central question in this project is:

*How does the transition to hybrid grocery shopping affect the healthiness of food purchases across both online and offline grocery channels?*

## Research method

This study uses real world panel purchase data of supermarkets in the Netherlands in 2019. The dataset contains real-world purchases by consumers in two grocery retailers and is collected by an international market research company. To ensure confidentiality, the market research 
company, retailers, and brands are anonymized. Additionally, the data has been modified to prevent any potential link back to the original entities. Given that this data is not publically accessible, the dataset has been stored in a separate branch in this GitHub directory. 
This was done to satisfy the automation requirements of the project: the makefile will download the data from this branch and store it into the main/master branch. Listed below are the final variables used in this analysis

The dataset contains purchase data of 150 unique households in the Netherlands in 2019. These households made over 180.000 individual product purchases across 26 different retailers. Listed below are the relevant variables after cleaning the data.

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



The formal analysis examines how the healthiness of households’ grocery baskets changes once they start shopping in online channels in addition to their in-store purchases. 
I employ a Difference-in-Difference (DiD) approach to compare the changes in healthiness of households weekly grocery purchases for households that transition to
hybrid shopping against those that continue shopping exclusively offline. Given that households get treated (i.e. adopt OGS) at different times, I use the staggered DiD approach proposed by Sant'Anna & Callaway (2021) to analyse the data and examine the research question.
To measure the healthiness of grocery baskets, I use the proportion of total expenditure that is spent on the product category fruits and vegetables.

## Repository overview
- README.md
- src:  all source codes used for data manipulation.
  * analysis
	* analysis.R
	* makefile
	* model_summaries.R
  * analysis
	* data_cleaning.R
	* data_exploration.pdf
	* data_exploration.Rmd
	* download_data.R
	* install_packages.R
	* makefile
	* weekly_aggregation.R
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

## Results

The overall effect of the DiD regression can be found in the table below. Given that the Sant'Anna & Callaway method runs a DiD regression for every cohort, we can not judge significance based on a p-value for the overal effects. Rather, by constructing a 95% confidence interval, I find that the proportion of expenditure towards
fruits and vegetables does not significantly change after adoption of OGS. In the gen/paper directory more plots can be found that analyse cohorts individually and that look at the change in healthiness over a 8-week time window around adoption. This latter plot thus looks at the DiD results through the lens of an event study to look at changes in trends around adoption. However, this plot does not show significant results either.

| ATT   | Std_error | CI_lower | CI_upper |
|-------|-----------|----------|----------|
| -2.44 | 1.574     | -5.526   | 0.646    |


## Conclusion
In this study, I analyzed whether the purchasing patterns of households change upon adopting online grocery shopping. Utilizing a staggered Difference-in-Differences approach (Sant'Anna & Callaway, 2021), I examined whether the proportion of expenditure allocated to healthy product categories, specifically fruits and vegetables, changes after a household's first online shopping trip.
The results revealed no statistically significant changes in expenditure patterns towards these healthy categories following the transition to online shopping. This lack of significance indicates that there is insufficient evidence to conclude that the adoption to online grocery shopping leads to a notable shift in the healthiness of households weekly grocery purchases.


## Data Preparation & Workflow Management - Team 14 
* Melle Klein Goldewijk (m.kleingoldewijk@tilburguniversity.edu)
