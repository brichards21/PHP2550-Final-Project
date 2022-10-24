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

- `data`: This folder contains the `.csv` data files used in order to conduct the analyses for our study. Within the data folder is a folder entitled `raw_data`. This folder contains the raw data files pulled directly from the [NCBI website](https://www.ncbi.nlm.nih.gov/pathogens/). Cleaned data used for the study is stored outside of the `raw_data` folder. Within this folder is a `data_cleaning.R` file that compiles all of the code involved in the data cleaning process.

- `Literature`: This folder contains all of the relevant literature reviewed for the sake of this study and project. 

- `data_EDA.Rmd` and `data_EDA.Rmd`: This file contains the code and text related to the full Exploratory Data Analysis report done for the study. The pdf version will have the code hidden.

- `literature_review.Rmd` and `literature_review.pdf`: This file contains the isolated written Literature Review done for the study. The pdf version will have the code hidden. **(TO BE ADDED)**

- `lit_review_EDA.Rmd` and `lit_review_EDA.pdf`: This file contains the Rmd file for the combined Literature Review and EDA report. The pdf version will have the code hidden. **(TO BE ADDED)**


More folders and files to be added throughout the course of the project.


## Collaborators

[Yanru Liao](https://github.com/yanruliao)

[Jina Yang](https://github.com/JinaYang777)

[Breanna Richards](https://github.com/brichards21)
