# read in raw salmonella data
salmonella_isolates <- read_csv("raw_data/salmonella_isolates.csv")

# read in raw ecoli data
ecoli_isolates <- read_csv("raw_data/ecoli_isolates.csv")

# read in raw campylobacter data
campylobacter_isolates <- read_csv("raw_data/campylobacter_isolates.csv")

# combine raw data
isolates_df <- rbind(salmonella_isolates, ecoli_isolates, campylobacter_isolates) %>%
  clean_names() %>%
  rename(organism_group = number_organism_group)

# remove variables not of interest
isolates_df <- as.data.frame(isolates_df) %>%
  select(-c(source_type, bio_sample, assembly, create_date, bio_sample,
            isolate_identifiers))

# remove variables with high missingness
isolates_df <- isolates_df %>%
  select(-c(outbreak, host_disease, host))

# extract the year from collection date
isolates_df$collection_date <- substr(isolates_df$collection_date, 1, 4)

# make collection date numeric
isolates_df <- isolates_df %>%
  mutate(collection_date = as.numeric(collection_date))


serovar_salm <- isolates_df %>%
  group_by(organism_group, serovar) %>%
  summarise(n = n()) %>%
  mutate(freq = n / sum(n)) %>%
  filter(organism_group == "Salmonella enterica") %>%
  arrange(desc(freq))

serovar_over1 <- unique(serovar_salm[serovar_salm$freq > 0.02, ]$serovar)

# group serovar variable
isolates_df <- isolates_df %>%
  mutate(serovar_new = ifelse(serovar %in% serovar_over1, serovar,
                              "Other"))


# antibiotic resistance cleaning
AST_df <- isolates_df[, c("isolate", "ast_phenotypes")] 

reorg_AST_df <- data.frame(matrix(ncol = 4, nrow = 0))
colnames(reorg_AST_df) <- c("resist_comb", "suscept_comb",
                            "resist", "suscept")

for (i in 1:nrow(AST_df)) {
  
  R_vec <- c() # resistant
  S_vec <- c() # susceptible
  R_comb <- c() # resistant & intermediate
  S_comb <- c() # susceptible & susceptible-dose dependent
  
  
  pheno <- AST_df[i, ]$ast_phenotypes
  split_pheno <- str_split(pheno, ",")
  for (j in 1:length(split_pheno[[1]]))
  {
    if(grepl("=R", split_pheno[[1]][j]))
    {
      R_vec <- c(R_vec, split_pheno[[1]][j])
    } 
    
    if (grepl("=S", split_pheno[[1]][j])) {
      S_vec <- c(S_vec, split_pheno[[1]][j])
    }
    
    if (grepl("=R", split_pheno[[1]][j]) | grepl("=I", split_pheno[[1]][j])){
      R_comb <- c(R_comb, split_pheno[[1]][j])
    } 
    
    if (grepl("=S", split_pheno[[1]][j]) | grepl("=SDD", split_pheno[[1]][j])){
      
      S_comb <- c(S_comb, split_pheno[[1]][j])
    }
    
  }
  
  R_vec <- substr(R_vec,1,nchar(R_vec)-2)
  R_vec <- paste(R_vec, collapse = ", ")
  
  S_vec <- substr(S_vec,1,nchar(S_vec)-2)
  S_vec <- paste(S_vec, collapse = ", ")
  
  R_comb <- substr(R_comb,1,nchar(R_comb)-2)
  R_comb <- paste(R_comb, collapse = ", ")
  
  S_comb <- substr(S_comb,1,nchar(S_comb)-2)
  S_comb <- paste(S_comb, collapse = ", ")
  
  
  
  reorg_AST_df <- rbind(reorg_AST_df, 
                        data.frame("resist_comb" = R_comb,
                                   "suscept_comb" = S_comb,
                                   "resist" = R_vec,
                                   "suscept" = S_vec))
}


isolates_df <- cbind(isolates_df, reorg_AST_df) %>%
  select(-ast_phenotypes)



# extract country from location variable
isolates_df<- isolates_df %>%
  mutate(country = gsub(":.*$", "", location))



# regroup isolation source variable
isolates_df <- isolates_df %>%
  mutate(isolation_source = tolower(isolation_source),
         isolation_source_new = ifelse(grepl("pork", isolation_source) |
                                         grepl("swine", isolation_source) |
                                         grepl("hog", isolation_source) |
                                         grepl("chops", isolation_source) |
                                         grepl("salami", isolation_source),
                                       "pork",
                                       ifelse(grepl("chicken", isolation_source),
                                              "chicken",
                                              ifelse(grepl("beef", isolation_source) |
                                                       grepl("GB", isolation_source) |
                                                       grepl("heifer", isolation_source) |
                                                       grepl("cattle", isolation_source),
                                                     "beef",
                                                     ifelse(grepl("turkey", isolation_source), "turkey", 
                                                            ifelse(grepl("ox", isolation_source), "ox",
                                                                   ifelse(grepl("dairy", isolation_source), "dairy",
                                                                          ifelse(grepl("stool", isolation_source) |
                                                                                   grepl("blood", isolation_source) |
                                                                                   grepl("feces", isolation_source) |
                                                                                   grepl("manure", isolation_source) |
                                                                                   grepl("rect", isolation_source) | grepl("anus", isolation_source), "stool",
                                                                                 ifelse(grepl("blood", isolation_source), "blood",
                                                                                        ifelse(grepl("urine", isolation_source), "urine",
                                                                                               ifelse(grepl("shrimp", isolation_source), "shrimp",
                                                                                                      ifelse(grepl("salmon", isolation_source), "salmon",
                                                                                                             ifelse(grepl("egg", isolation_source), "egg",
                                                                                                                    ifelse(grepl("water", isolation_source) |
                                                                                                                             grepl("drainage", isolation_source), "water",
                                                                                                                           ifelse(is.na(isolation_source), NA, "other/unspecified")))))))))))))))

isolates_df <- isolates_df %>%
  mutate(isolation_source_new = ifelse(isolation_source_new %in% c("egg", "salmon", "shrimp"),
                                       "other/unspecified", isolation_source_new))



# create new 'closeness' variable defined by SNP differences <= 7
isolates_df <- isolates_df %>%
  mutate(close_min_diff = ifelse(min_diff <= 7, TRUE, FALSE),
         close_min_same = ifelse(min_same <= 7, TRUE, FALSE),
         num_close = close_min_diff + close_min_same) %>%
  select(-c(close_min_diff, close_min_same))


# separate computed_types variable into antigen formula and serotype
isolates_df <- isolates_df %>%
  separate(computed_types, c("antigen_formula", "serotype"), ",serotype=") %>%
  mutate(antigen_formula = str_remove(antigen_formula, "antigen_formula="))


# regroup antigen formula variable
count_antigen <- isolates_df[isolates_df$organism_group == "Salmonella enterica", ] %>%
  group_by(antigen_formula) %>%
  summarise(freq = n() / nrow(isolates_df)) %>%
  arrange(desc(freq))

antigen_over_2 <- count_antigen %>%
  filter(freq >= 0.02)

antigen_over_2 <- antigen_over_2$antigen_formula


isolates_df <- isolates_df %>%
  mutate(antigen_formula_new = ifelse(antigen_formula %in% antigen_over_2, 
                                      antigen_formula,
                                      "Other"))



# lowercase all antibiotic responses 
isolates_df <- isolates_df %>% mutate_all(na_if,"") %>%
  mutate(suscept = tolower(suscept),
         resist = tolower(resist),
         suscept_comb = tolower(suscept_comb),
         resist_comb = tolower(resist_comb)
  )


mean_sim_func <- function(string, clusters) {
  # string variable is the drug resistance variable of interest
  # clusters variable is the snp_clusters grouping variable
  
  sim <- c()
  
  purrr::map_dbl(seq_along(string), function(i) {
    
    
    for (j in 1:length(clusters)) {
      
      if (clusters[j] == clusters[i] & i != j &
          !is.na(clusters[j]) & !is.na(clusters[i]))
      {
        sim <- c(sim, stringdist::stringsim(string[i], string[j]))
      }
      
    }
    
    mean(sim)
    
  })
}



# compute within-cluster similarity values
isolates_df <- isolates_df %>%
 mutate(suscept_sim = mean_sim_func(suscept_comb, snp_cluster),
        resist_sim = mean_sim_func(resist_comb, snp_cluster),
        )





### ANTIBIOTIC DATA ###


# resistance drugs
drug_res <- c(isolates_df$resist_comb)
drug_res <- drug_res[!is.na(drug_res)]

drug_res <- unlist(strsplit(drug_res, split = ","))
drug_res <- trimws(drug_res)
drug_res <- unique(drug_res)

# susceptibility drugs
drug_sus <- c(isolates_df$suscept_comb)
drug_sus <- drug_sus[!is.na(drug_sus)]

drug_sus <- unlist(strsplit(drug_sus, split = ","))
drug_sus <- trimws(drug_sus)
drug_sus <- unique(drug_sus)



########## RESISTANCE DATA ##########

resistance_df <- data.frame(matrix(nrow = nrow(isolates_df),
                                   ncol = length(drug_res)))

colnames(resistance_df) <- drug_res

resistance_df <- cbind(isolate = isolates_df$isolate, resistance_df)

# give isolate value of 1 if resistant, 0 o.w.
for (i in 1:nrow(isolates_df)) {
  for (j in 1:length(drug_res)) {
    if (grepl(drug_res[j], isolates_df[i, "resist_comb"]))
    {
      resistance_df[i, drug_res[j]] <- 1
    }
    else {
      resistance_df[i, drug_res[j]] <- 0
    }
  }
}

resistance_df <- cbind(strain = isolates_df$strain, organism_group = isolates_df$organism_group,
                       collection_date = isolates_df$collection_date,
                       snp_cluster = isolates_df$snp_cluster, resistance_df)


# compute mean resistance response per drug
resistance_sum <- resistance_df %>%
  group_by(snp_cluster, collection_date) %>%
  summarise_if(is.numeric, funs(mean)) %>%
  pivot_longer(!c(snp_cluster, collection_date), names_to = "drug",
               values_to = "resistance")



########## SUSCEPTIBLE DATA ##########


susceptible_df <- data.frame(matrix(nrow = nrow(isolates_df),
                                    ncol = length(drug_sus)))

colnames(susceptible_df) <- drug_sus


susceptible_df <- cbind(isolate = isolates_df$isolate, susceptible_df)

# give isolate value of 1 if susceptible, 0 o.w.
for (i in 1:nrow(isolates_df)) {
  for (j in 1:length(drug_sus)) {
    if (grepl(drug_sus[j], isolates_df[i, "suscept_comb"]))
    {
      susceptible_df[i, drug_sus[j]] <- 1
    }
    else {
      susceptible_df[i, drug_sus[j]] <- 0
    }
  }
}

susceptible_df <- cbind(strain = isolates_df$strain, organism_group = isolates_df$organism_group,
                        collection_date = isolates_df$collection_date,
                        snp_cluster = isolates_df$snp_cluster, susceptible_df)


# compute mean susceptible response per drug
susceptible_sum <- susceptible_df %>%
  group_by(snp_cluster, collection_date) %>%
  summarise_if(is.numeric, funs(mean)) %>%
  pivot_longer(!c(snp_cluster, collection_date), names_to = "drug",
               values_to = "susceptibility")

