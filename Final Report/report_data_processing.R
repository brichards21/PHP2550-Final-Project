
# report data processing 

# read ecoli and campy data
ecoli_campy_long <- read_csv("report_data/ecoli_campy_long.csv")

# read salmonella data
salmonella_long <- read_csv("report_data/salmonella_long.csv")







## SALMONELLA TETRACYCLINE ##

salmonella_all_antibiotics <- c("tetracycline",
                                "streptomycin",
                                "sulfisoxazole",
                                "ampicillin")

anti_tetra <- salmonella_all_antibiotics[!salmonella_all_antibiotics %in% c("tetracycline")]

salmonella_tet <- salmonella_long[,!colnames(salmonella_long) %in%
                                    anti_tetra]


## SALMONELLA STREPTOMYCIN ##


anti_strep <- salmonella_all_antibiotics[!salmonella_all_antibiotics %in% c("streptomycin")]

salmonella_strep <- salmonella_long[,!colnames(salmonella_long) %in%
                                      anti_strep]


## SALMONELLA SULFISOXAZOLE ##


anti_sulf <- salmonella_all_antibiotics[!salmonella_all_antibiotics %in% c("sulfisoxazole")]

salmonella_sulf <- salmonella_long[,!colnames(salmonella_long) %in%
                                     anti_sulf]


## SALMONELLA AMPICILLIN ##


anti_amp <- salmonella_all_antibiotics[!salmonella_all_antibiotics %in% c("ampicillin")]

salmonella_amp <- salmonella_long[,!colnames(salmonella_long) %in%
                                    anti_amp]











ecoli_long <- ecoli_campy_long %>%
  filter(organism_group == "E.coli and Shigella") %>%
  select(-organism_group)

campy_long <- ecoli_campy_long %>%
  filter(organism_group == "Campylobacter jejuni") %>%
  select(-organism_group)







ecoli_campy_all_antibiotics <- c("tetracycline",
                                 "meropenem",
                                 "ciprofloxacin",
                                 "ampicillin",
                                 "gentamicin",
                                 "erythromycin",
                                 "florfenicol",
                                 "azithromycin",
                                 "clindamycin",
                                 "nalidixic_acid")







## ECOLI Tetracycline ##


anti_tetra_ecolicamp <- ecoli_campy_all_antibiotics[!ecoli_campy_all_antibiotics %in% c("tetracycline")]

ecoli_tetra <- ecoli_long[,!colnames(ecoli_long) %in%
                            anti_tetra_ecolicamp]




## ECOLI MEROPENEM ##


anti_mero_ecolicamp <- ecoli_campy_all_antibiotics[!ecoli_campy_all_antibiotics %in% c("meropenem")]

ecoli_mero <- ecoli_long[,!colnames(ecoli_long) %in%
                           anti_mero_ecolicamp]



## ECOLI CIPROFLOXACIN ##


anti_cip_ecolicamp <- ecoli_campy_all_antibiotics[!ecoli_campy_all_antibiotics %in% c("ciprofloxacin")]

ecoli_cip <- ecoli_long[,!colnames(ecoli_long) %in%
                          anti_cip_ecolicamp]



## ECOLI AMPICILLIN ##


anti_amp_ecolicamp <- ecoli_campy_all_antibiotics[!ecoli_campy_all_antibiotics %in% c("ampicillin")]

ecoli_amp <- ecoli_long[,!colnames(ecoli_long) %in%
                          anti_amp_ecolicamp]











## CAMPY GENTAMICIN ##


anti_gent_ecolicamp <- ecoli_campy_all_antibiotics[!ecoli_campy_all_antibiotics %in% c("gentamicin")]

campy_gent <- campy_long[,!colnames(campy_long) %in%
                           anti_gent_ecolicamp]


## CAMPY ERYTHROMICIN ##


anti_ery_ecolicamp <- ecoli_campy_all_antibiotics[!ecoli_campy_all_antibiotics %in% c("erythromycin")]

campy_ery <- campy_long[,!colnames(campy_long) %in%
                          anti_ery_ecolicamp]



## CAMPY TETRACYCLINE ##


anti_tetra_ecolicamp <- ecoli_campy_all_antibiotics[!ecoli_campy_all_antibiotics %in% c("tetracycline")]

campy_tetra <- campy_long[,!colnames(campy_long) %in%
                            anti_tetra_ecolicamp]




## CAMPY CIPROFLOXACIN ##


anti_cip_ecolicamp <- ecoli_campy_all_antibiotics[!ecoli_campy_all_antibiotics %in% c("ciprofloxacin")]

campy_cip <- campy_long[,!colnames(campy_long) %in%
                          anti_cip_ecolicamp]









# salmonella tetracycline
fact_cols_tet <- c("isolation_type", "serovar_new",
                   "country", "isolation_source_new",
                   "antigen_formula_new",
                   colnames(salmonella_tet)[11:23])

salmonella_tet[fact_cols_tet] <- lapply(salmonella_tet[fact_cols_tet], factor)


# salmonella streptomycin
fact_cols_strep <- c("isolation_type", "serovar_new",
                     "country", "isolation_source_new",
                     "antigen_formula_new",
                     colnames(salmonella_strep)[11:23])


salmonella_strep[fact_cols_strep] <- lapply(salmonella_strep[fact_cols_strep], factor)


# salmonella sulfisoxazole
fact_cols_sulf <- c("isolation_type", "serovar_new",
                    "country", "isolation_source_new",
                    "antigen_formula_new",
                    colnames(salmonella_sulf)[11:23])


salmonella_sulf[fact_cols_sulf] <- lapply(salmonella_sulf[fact_cols_sulf], factor)


# salmonella ampicillin
fact_cols_amp <- c("isolation_type", "serovar_new",
                   "country", "isolation_source_new",
                   "antigen_formula_new",
                   colnames(salmonella_amp)[11:23])


salmonella_amp[fact_cols_amp] <- lapply(salmonella_amp[fact_cols_amp], factor)








# ecoli tetracycline
fact_cols_tet_e <- c("isolation_type", 
                     "country", "isolation_source_new",
                     colnames(ecoli_tetra)[10:23])

ecoli_tetra[fact_cols_tet_e] <- lapply(ecoli_tetra[fact_cols_tet_e], factor)


# ecoli meropenem
fact_cols_mero <- c("isolation_type", 
                    "country", "isolation_source_new",
                    colnames(ecoli_mero)[10:23])


ecoli_mero[fact_cols_mero] <- lapply(ecoli_mero[fact_cols_mero], factor)


# ecoli ciprofloxacin
fact_cols_cip <- c("isolation_type", 
                   "country", "isolation_source_new",
                   colnames(ecoli_cip)[10:23])


ecoli_cip[fact_cols_cip] <- lapply(ecoli_cip[fact_cols_cip], factor)


# ecoli ampicillin
fact_cols_amp <- c("isolation_type", 
                   "country", "isolation_source_new",
                   colnames(ecoli_amp)[10:23])


ecoli_amp[fact_cols_amp] <- lapply(ecoli_amp[fact_cols_amp], factor)










# campy tetracycline
fact_cols_tet_c <- c("isolation_type", 
                     "country", "isolation_source_new",
                     colnames(campy_tetra)[10:23])

campy_tetra[fact_cols_tet_c] <- lapply(campy_tetra[fact_cols_tet_c], factor)


# campy gentamicin
fact_cols_gent <- c("isolation_type", 
                    "country", "isolation_source_new",
                    colnames(campy_gent)[10:23])


campy_gent[fact_cols_gent] <- lapply(campy_gent[fact_cols_gent], factor)


# campy erythromycin
fact_cols_ery <- c("isolation_type", 
                   "country", "isolation_source_new",
                   colnames(campy_ery)[10:23])


campy_ery[fact_cols_ery] <- lapply(campy_ery[fact_cols_ery], factor)


# campy ciprofloxacin
fact_cols_cip_c <- c("isolation_type", 
                     "country", "isolation_source_new",
                     colnames(campy_cip)[10:23])


campy_cip[fact_cols_cip_c] <- lapply(campy_cip[fact_cols_cip_c], factor)









set.seed(1)
salm_sample <- sample(c(TRUE, FALSE), nrow(salmonella_long), replace=TRUE, prob=c(0.8,0.2))

ecoli_sample <- sample(c(TRUE, FALSE), nrow(ecoli_long), replace=TRUE, prob=c(0.8,0.2))

campy_sample <- sample(c(TRUE, FALSE), nrow(campy_long), replace=TRUE, prob=c(0.8,0.2))







# training sets
salm_tet_train <- salmonella_tet[salm_sample,]
salm_strep_train <- salmonella_strep[salm_sample,]
salm_sulf_train <- salmonella_sulf[salm_sample,]
salm_amp_train <- salmonella_amp[salm_sample,]

ecoli_tet_train <- ecoli_tetra[ecoli_sample,]
ecoli_mero_train <- ecoli_mero[ecoli_sample,]
ecoli_cip_train <- ecoli_cip[ecoli_sample,]
ecoli_amp_train <- ecoli_amp[ecoli_sample,]

campy_tet_train <- campy_tetra[campy_sample,]
campy_gent_train <- campy_gent[campy_sample,]
campy_ery_train <- campy_ery[campy_sample,]
campy_cip_train <- campy_cip[campy_sample,]


# testing sets
salm_tet_test <- salmonella_tet[-salm_sample,]
salm_strep_test <- salmonella_strep[-salm_sample,]
salm_sulf_test <- salmonella_sulf[-salm_sample,]
salm_amp_test <- salmonella_amp[-salm_sample,]

ecoli_tet_test <- ecoli_tetra[-ecoli_sample,]
ecoli_mero_test <- ecoli_mero[-ecoli_sample,]
ecoli_cip_test <- ecoli_cip[-ecoli_sample,]
ecoli_amp_test <- ecoli_amp[-ecoli_sample,]

campy_tet_test <- campy_tetra[-campy_sample,]
campy_gent_test <- campy_gent[-campy_sample,]
campy_ery_test <- campy_ery[-campy_sample,]
campy_cip_test <- campy_cip[-campy_sample,]


#### variable selection procedure ####

boruta_salm_tetra <- Boruta(tetracycline ~ ., data = salm_tet_train, doTrace = 2)
# none unimportant

boruta_salm_strep <- Boruta(streptomycin ~ ., data = salm_strep_train, doTrace = 2)
# none unimportant

boruta_salm_amp <- Boruta(ampicillin ~ ., data = salm_amp_train, doTrace = 2)
# none unimportant

boruta_salm_sulf <- Boruta(sulfisoxazole ~ ., data = salm_sulf_train, doTrace = 2)
# none unimportant


#boruta_ecoli_tetra <- Boruta(tetracycline ~ ., data = ecoli_tet_train, doTrace = 2)
# aph_3_ii_ia_complete, bla_oxa_193_complete, gyr_a_t86i_point, tet_o_complete, x50s_122_a103v_point


ecoli_tet_train <- ecoli_tet_train %>%
  select(-c(aph_3_ii_ia_complete, bla_oxa_193_complete, gyr_a_t86i_point, tet_o_complete, x50s_l22_a103v_point))


#boruta_ecoli_mero <- Boruta(meropenem ~ ., data = ecoli_mero_train, doTrace = 2)
# bla_oxa_193_complete, x50s_122_a103v_point, gyr_a_t86i_point, bla_oxa_complete, tet_o_complete, aph_3_ii_ia_complete, and bla_ec_complete


ecoli_mero_train <- ecoli_mero_train %>%
  select(-c(bla_oxa_193_complete, x50s_l22_a103v_point, gyr_a_t86i_point, bla_oxa_complete, tet_o_complete, aph_3_ii_ia_complete, bla_ec_complete))


#boruta_ecoli_amp <- Boruta(ampicillin ~ ., data = ecoli_amp_train, doTrace = 2)
# aph_3_ii_ia_complete, bla_oxa_193_complete, gyr_a_t86i_point, tet_o_complete, x50s_122_a103v_point


ecoli_amp_train <- ecoli_amp_train %>%
  select(-c(aph_3_ii_ia_complete, bla_oxa_193_complete, gyr_a_t86i_point, tet_o_complete, x50s_l22_a103v_point))


#boruta_ecoli_cip <- Boruta(ciprofloxacin ~ ., data = ecoli_cip_train, doTrace = 2)
# aph_3_ii_ia_complete, bla_oxa_193_complete, gyr_a_t86i_point, tet_o_complete, x50s_l22_a103v_point

ecoli_cip_train <- ecoli_cip_train %>%
  select(-c(aph_3_ii_ia_complete, bla_oxa_193_complete, gyr_a_t86i_point, tet_o_complete, x50s_l22_a103v_point))




#boruta_campy_tetra <- Boruta(tetracycline ~ ., data = campy_tet_train, doTrace = 2)
# acr_f_complete, aph_3_ib_complete, aph_6_id_complete, bla_ec_complete, mdt_m_complete, tet_a_complete, sulf2_complete

campy_tet_train <- campy_tet_train %>%
  select(-c(acr_f_complete, aph_3_ib_complete, aph_6_id_complete, bla_ec_complete, mdt_m_complete, tet_a_complete, sul2_complete))


#boruta_campy_gent <- Boruta(gentamicin ~ ., data = campy_gent_train, doTrace = 2)
# same unimportant

campy_gent_train <- campy_gent_train %>%
  select(-c(acr_f_complete, aph_3_ib_complete, aph_6_id_complete, bla_ec_complete, mdt_m_complete, tet_a_complete, sul2_complete))


#boruta_campy_ery <- Boruta(erythromycin ~ ., data = campy_ery_train, doTrace = 2)
# same unimportant

campy_ery_train <- campy_ery_train %>%
  select(-c(acr_f_complete, aph_3_ib_complete, aph_6_id_complete, bla_ec_complete, mdt_m_complete, tet_a_complete, sul2_complete))


#boruta_campy_cip <- Boruta(ciprofloxacin ~ ., data = campy_cip_train, doTrace = 2)
# none unimportant

campy_cip_train <- campy_cip_train %>%
  select(-c(acr_f_complete, aph_3_ib_complete, aph_6_id_complete, bla_ec_complete, mdt_m_complete, tet_a_complete, sul2_complete))







# write training and test set data in report data folder
write_csv(salm_tet_train, "report_data/salm_tet_train.csv")
write_csv(salm_strep_train, "report_data/salm_strep_train.csv")
write_csv(salm_sulf_train, "report_data/salm_sulf_train.csv")
write_csv(salm_amp_train, "report_data/salm_amp_train.csv")

write_csv(salm_tet_test, "report_data/salm_tet_test.csv")
write_csv(salm_strep_test, "report_data/salm_strep_test.csv")
write_csv(salm_sulf_test, "report_data/salm_sulf_test.csv")
write_csv(salm_amp_test, "report_data/salm_amp_test.csv")


write_csv(ecoli_tet_train, "report_data/ecoli_tet_train.csv")
write_csv(ecoli_mero_train, "report_data/ecoli_mero_train.csv")
write_csv(ecoli_cip_train, "report_data/ecoli_cip_train.csv")
write_csv(ecoli_amp_train, "report_data/ecoli_amp_train.csv")


write_csv(ecoli_tet_test, "report_data/ecoli_tet_test.csv")
write_csv(ecoli_mero_test, "report_data/ecoli_mero_test.csv")
write_csv(ecoli_cip_test, "report_data/ecoli_cip_test.csv")
write_csv(ecoli_amp_test, "report_data/ecoli_amp_test.csv")


write_csv(campy_tet_train, "report_data/campy_tet_train.csv")
write_csv(campy_cip_train, "report_data/campy_cip_train.csv")
write_csv(campy_ery_train, "report_data/campy_ery_train.csv")
write_csv(campy_gent_train, "report_data/campy_gent_train.csv")


write_csv(campy_tet_test, "report_data/campy_tet_test.csv")
write_csv(campy_cip_test, "report_data/campy_cip_test.csv")
write_csv(campy_ery_test, "report_data/campy_ery_test.csv")
write_csv(campy_gent_test, "report_data/campy_gent_test.csv")



