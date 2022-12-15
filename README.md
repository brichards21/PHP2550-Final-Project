# Drug Resistance and Susceptibility for Foodborne Illnesses in the Salmonella, E.coli, and Campylobacter Species

This project was conducted as a final project for the PHP2550 Fall2022 Practical Data Analysis class taken within Brown University's School of Public Health.


## Intro: 
Every year approximately 1 in 10 people globally contract some kind of foodborne illness, including isteria,
Salmonella, and E. Coli. About 420,000 die from these illnesses annually. While multi-state outbreaks are recorded on the CDC website, but it can be a tedious process to track these cases to their sources and impose appropriate prevention regulations in a timely manner. The goal of this project is to use
past data on foodborne illness occurrence to help prevent and reduce future cases. This project is informed by the objectives of the [Healthy People 2030 Foodborne Illness Reduction Committee](https://health.gov/healthypeople/objectives-and-data/browse-objectives/foodborne-illness). The scope of this project focuses on potential intervention and treatment measures in the form of antibiotic response.

- In this project, we will predict drug resistance and susceptibility of bacteria isolates based on genomics. We plan to tract how these characteristics change over time as well as how drug resistance changes over time. This will allow us to forecast bacteria-related foodborne disease antibiotic response for future cases. 

## Data Source:
The primary data source used in this project is the [National Center for Biotechnology Information’s
(NCBI) Pathogen database](https://www.ncbi.nlm.nih.gov/pathogens/). This database includes information about sequenced bacterial pathogens that originate from a food source. It records isolates with source and genetic information. For the purposes of this study, data on the Salmonella enterica, E.coli and Shigella, and Campylobacter jejuni species were extracted on *October 16, 2022*. Thus, this study only retains records that were updated up to that date.

## Goal: 
- The goal of our project is to investigate if we can identify the antibiotic resistance of future isolates. We will establish a system that recommends antibiotics to future isolates from previous isolates.
- Generally, we will also extract patterns and associations between genomic, clinical, and environmental characteristics of foodborne illness isolates and assess how they relate to antibiotic response. 

## Tech used: 
- R Version 4.2.0 and RStudio
- R Markdown

------------------------------------------------------------

## Organization 

**Methods and Analysis folder**

- `updated_preprocessing`: The file containing code for updated data pre-processing since EDA was performed

- `methods_analysis_report.Rmd` and `methods_analysis_report.pdf`: This file contains the isolated written Methods and Analysis report done for the study. The pdf version will have relevant code hidden. 


**Data folder**

This folder contains the `.csv` data files used in order to conduct the analyses for our study.

- `raw_data` folder: This folder contains the raw data files pulled directly from the [NCBI website](https://www.ncbi.nlm.nih.gov/pathogens/). 

- `salmonella_imputed`: This folder contains the 5 multiple imputed data sets created for missingness in Salmonella isolates.

- `ecoli_campy_imputed`: This folder contains the 5 multiple imputed data sets created for missingness in E coli and Campylobacter isolates.

- `Appendix Tables`: This folder contains supplementary figures and tables.

Cleaned data used for the study is stored outside of any internal folders. Within this folder is a `data_cleaning.R` file that compiles all of the code involved in the data cleaning process.

- `isolates_df.csv`: The intermediate combined data file for all isolates.

- `salmonella_df.csv`: The `isolates_df.csv` data but only for Salmonella isolates.

- `ecoli_campy_df.csv`: The `isolates_df.csv` data but only for Ecoli and Campylobacter isolates.

- `imputed_tetra_test_df.csv`: A test dataset for multiple imputation

- `resistance_df.csv`: A separate dataset highlighting each isolates' resistance response to every antibiotic recorded (value of 1 for recorded as resistant, 0 for not recorded as resistant)

- `susceptible_df.csv`: A separate dataset highlighting each isolates' susceptibility response to every antibiotic recorded (value of 1 for recorded as susceptible, 0 for not recorded as susceptible) 



**Literature folder** 

This folder contains all of the relevant literature reviewed for the sake of this study and project. 


**Literature Review and EDA folder** 


- `data_EDA.Rmd` and `data_EDA.Rmd`: This file contains the code and text related to the full Exploratory Data Analysis report done for the study. The pdf version will have the code hidden.

- `literature_review.Rmd` and `literature_review.pdf`: This file contains the isolated written Literature Review done for the study. The pdf version will have the code hidden. 

- `lit_review_EDA.Rmd` and `lit_review_EDA.pdf`: This file contains the Rmd file for the combined Literature Review and EDA report. The pdf version will have the code hidden. 


**Poster folder**

This folder contains the research poster as well as associated images for this project. 


**Final Report folder**

This folder contains all relevant material related to the final report of this project. 

- The `report_data` folder within this folder contains all of the data referred to in the writing of the report, with additional processing as detailed in `report_data_processing.R`. 

- This data is also called and utilized in the `Final_Report.Rmd` file which contains both the written text and the code primarily for the random forest and logistic regression model runs as well as the extraction of performance on the test sets. 

- The `report_figures` folder within the Final Report folder contains the figures in the report that were not created directly in RMarkdown. Inside of the `report_figures` folder is code for the variable importance plots displayed in the report.

- The `hyperparameter_tuning.R` file contains the code for tuning the hyperparameters of the random foreset models.






## Collaborators

[Yanru Liao](https://github.com/yanruliao)

[Jina Yang](https://github.com/JinaYang777)

[Breanna Richards](https://github.com/brichards21)
