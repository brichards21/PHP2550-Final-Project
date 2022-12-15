






# hyperparameter tuning

# SALMONELLA TETRACYCLINE MODELS

m <- ncol(salm_tet_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_salm_tet <- as.vector(prop.table(table(salm_tet_train$tetracycline)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_salm_tet <- ranger(
    formula = tetracycline ~ .,
    data = salm_tet_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_salm_tet[1], 
                      1/class_prop_salm_tet[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_salm_tet$prediction.error
  
}

# salm_all_predictors tetracycline  
# best parameters: mtry = m/2 (7), ntree = 250






# source only 
salm_tet_train_source <- salm_tet_train[, -c(3:4, 8:22)]

m <- ncol(salm_tet_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_salm_tet_s <- ranger(
    formula = tetracycline ~ .,
    data = salm_tet_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_salm_tet[1], 
                      1/class_prop_salm_tet[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_salm_tet_s$prediction.error
  
}

# salm_source_predictors tetracycline  
# best parameters: mtry =  2, ntree = 1000








# hyperparameter tuning

# SALMONELLA STREPTOMYCIN MODELS

m <- ncol(salm_strep_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_salm_strep <- as.vector(prop.table(table(salm_strep_train$streptomycin)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_salm_strep <- ranger(
    formula = streptomycin ~ .,
    data = salm_strep_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_salm_strep[1], 
                      1/class_prop_salm_strep[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_salm_strep$prediction.error
  
}

# salm_all_predictors streptomycin  
# best parameters: mtry = 11, ntree = 500 






# source only 
salm_strep_train_source <- salm_strep_train[, -c(3:4, 8:22)]

m <- ncol(salm_strep_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_salm_strep_s <- ranger(
    formula = streptomycin ~ .,
    data = salm_strep_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_salm_strep[1], 
                      1/class_prop_salm_strep[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_salm_strep_s$prediction.error
  
}

# salm_source_predictors streptomycin  
# best parameters: mtry = 2 , ntree = 1000 








# hyperparameter tuning

# SALMONELLA SULFISOXAZOLE MODELS

m <- ncol(salm_sulf_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_salm_sulf <- as.vector(prop.table(table(salm_sulf_train$sulfisoxazole)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_salm_sulf <- ranger(
    formula = sulfisoxazole ~ .,
    data = salm_sulf_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_salm_sulf[1], 
                      1/class_prop_salm_sulf[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_salm_sulf$prediction.error
  
}

# salm_all_predictors sulfisoxazole  
# best parameters: mtry = 7, ntree = 500 






# source only 
salm_sulf_train_source <- salm_sulf_train[, -c(3:4, 8:22)]

m <- ncol(salm_sulf_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_salm_sulf_s <- ranger(
    formula = sulfisoxazole ~ .,
    data = salm_sulf_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_salm_sulf[1], 
                      1/class_prop_salm_sulf[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_salm_sulf_s$prediction.error
  
}

# salm_source_predictors sulfisoxazole  
# best parameters: mtry = 2 , ntree = 250 







# hyperparameter tuning

# SALMONELLA AMPICILLIN MODELS

m <- ncol(salm_amp_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_salm_amp <- as.vector(prop.table(table(salm_amp_train$ampicillin)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_salm_amp <- ranger(
    formula = ampicillin ~ .,
    data = salm_amp_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_salm_amp[1], 
                      1/class_prop_salm_amp[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_salm_amp$prediction.error
  
}

# salm_all_predictors ampicillin  
# best parameters: mtry = 11, ntree = 250 






# source only 
salm_amp_train_source <- salm_amp_train[, -c(3:4, 8:22)]

m <- ncol(salm_amp_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_salm_amp_s <- ranger(
    formula = ampicillin ~ .,
    data = salm_amp_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_salm_amp[1], 
                      1/class_prop_salm_amp[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_salm_amp_s$prediction.error
  
}

# salm_source_predictors ampicillin  
# best parameters: mtry = 2 , ntree = 250 









# hyperparameter tuning

# ECOLI TETRACYCLINE MODELS

m <- ncol(ecoli_tet_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_ecoli_tet <- as.vector(prop.table(table(ecoli_tet_train$tetracycline)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_ecoli_tet <- ranger(
    formula = tetracycline ~ .,
    data = ecoli_tet_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_ecoli_tet[1], 
                      1/class_prop_ecoli_tet[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_ecoli_tet$prediction.error
  
}

# ecoli_all_predictors tetracycline  
# best parameters: mtry = 2, ntree = 1000






# source only 
ecoli_tet_train_source <- ecoli_tet_train[, -c(3:4, 7:17)]

m <- ncol(ecoli_tet_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_ecoli_tet_s <- ranger(
    formula = tetracycline ~ .,
    data = ecoli_tet_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_ecoli_tet[1], 
                      1/class_prop_ecoli_tet[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_ecoli_tet_s$prediction.error
  
}

# ecoli_source_predictors tetracycline  
# best parameters: mtry =  2, ntree = 1000






# hyperparameter tuning

# ECOLI MEROPENEM MODELS

m <- ncol(ecoli_mero_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_ecoli_mero <- as.vector(prop.table(table(ecoli_mero_train$meropenem)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_ecoli_mero <- ranger(
    formula = meropenem ~ .,
    data = ecoli_mero_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_ecoli_mero[1], 
                      1/class_prop_ecoli_mero[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_ecoli_mero$prediction.error
  
}

# ecoli_all_predictors meropenem  
# best parameters: mtry = 11, ntree = 250






# source only 
ecoli_mero_train_source <- ecoli_mero_train[, -c(3:4, 7:15)]

m <- ncol(ecoli_mero_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_ecoli_mero_s <- ranger(
    formula = meropenem ~ .,
    data = ecoli_mero_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_ecoli_mero[1], 
                      1/class_prop_ecoli_mero[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_ecoli_mero_s$prediction.error
  
}

# ecoli_source_predictors meropenem  
# best parameters: mtry =  2, ntree = 500







# hyperparameter tuning

# ECOLI CIPROFLOXACIN MODELS

m <- ncol(ecoli_cip_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_ecoli_cip <- as.vector(prop.table(table(ecoli_cip_train$ciprofloxacin)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_ecoli_cip <- ranger(
    formula = ciprofloxacin ~ .,
    data = ecoli_cip_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_ecoli_cip[1], 
                      1/class_prop_ecoli_cip[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_ecoli_cip$prediction.error
  
}

# ecoli_all_predictors ciprofloxacin  
# best parameters: mtry = 4, ntree = 500






# source only 
ecoli_cip_train_source <- ecoli_cip_train[, -c(3:4, 7:17)]

m <- ncol(ecoli_cip_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_ecoli_cip_s <- ranger(
    formula = ciprofloxacin ~ .,
    data = ecoli_cip_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_ecoli_cip[1], 
                      1/class_prop_ecoli_cip[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_ecoli_cip_s$prediction.error
  
}

# ecoli_source_predictors ciprofloxacin  
# best parameters: mtry =  1, ntree = 1000







# hyperparameter tuning

# ECOLI AMPICILLIN MODELS

m <- ncol(ecoli_amp_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_ecoli_amp <- as.vector(prop.table(table(ecoli_amp_train$ampicillin)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_ecoli_amp <- ranger(
    formula = ampicillin ~ .,
    data = ecoli_amp_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_ecoli_amp[1], 
                      1/class_prop_ecoli_amp[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_ecoli_amp$prediction.error
  
}

# ecoli_all_predictors ampicillin  
# best parameters: mtry = 5, ntree = 1000






# source only 
ecoli_amp_train_source <- ecoli_amp_train[, -c(3:4, 7:17)]

m <- ncol(ecoli_amp_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)







# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_ecoli_amp_s <- ranger(
    formula = ampicillin ~ .,
    data = ecoli_amp_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_ecoli_amp[1], 
                      1/class_prop_ecoli_amp[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_ecoli_amp_s$prediction.error
  
}

# ecoli_source_predictors ampicillin  
# best parameters: mtry =  1, ntree = 250






# hyperparameter tuning

# CAMPY TETRACYCLINE MODELS

m <- ncol(campy_tet_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_campy_tet <- as.vector(prop.table(table(campy_tet_train$tetracycline)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_campy_tet <- ranger(
    formula = tetracycline ~ .,
    data = campy_tet_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_campy_tet[1], 
                      1/class_prop_campy_tet[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_campy_tet$prediction.error
  
}

# campy_all_predictors tetracycline  
# best parameters: mtry = 7, ntree = 250






# source only 
campy_tet_train_source <- campy_tet_train[, -c(3:4, 7:15)]

m <- ncol(campy_tet_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)







# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_campy_tet_s <- ranger(
    formula = tetracycline ~ .,
    data = campy_tet_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_campy_tet[1], 
                      1/class_prop_campy_tet[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_campy_tet_s$prediction.error
  
}

# campy_source_predictors tetracycline  
# best parameters: mtry =  2, ntree = 250






# hyperparameter tuning

# CAMPY GENTAMICIN MODELS

m <- ncol(campy_gent_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_campy_gent <- as.vector(prop.table(table(campy_gent_train$gentamicin)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_campy_gent <- ranger(
    formula = gentamicin ~ .,
    data = campy_gent_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_campy_gent[1], 
                      1/class_prop_campy_gent[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_campy_gent$prediction.error
  
}

# campy_all_predictors gentamicin  
# best parameters: mtry = 5, ntree = 250






# source only 
campy_gent_train_source <- campy_gent_train[, -c(3:4, 7:15)]

m <- ncol(campy_gent_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)







# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_campy_gent_s <- ranger(
    formula = gentamicin ~ .,
    data = campy_gent_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_campy_gent[1], 
                      1/class_prop_campy_gent[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_campy_gent_s$prediction.error
  
}

# campy_source_predictors gentamicin  
# best parameters: mtry =  2, ntree = 500







# hyperparameter tuning

# CAMPY ERYTHROMYCIN MODELS

m <- ncol(campy_ery_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)





# gene + source
set.seed(1)

class_prop_campy_ery <- as.vector(prop.table(table(campy_ery_train$erythromycin)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_campy_ery <- ranger(
    formula = erythromycin ~ .,
    data = campy_ery_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_campy_ery[1], 
                      1/class_prop_campy_ery[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_campy_ery$prediction.error
  
}

# campy_all_predictors erythromycin  
# best parameters: mtry = 3, ntree = 500






# source only 
campy_ery_train_source <- campy_ery_train[, -c(3:4, 7:15)]

m <- ncol(campy_ery_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)







# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_campy_ery_s <- ranger(
    formula = erythromycin ~ .,
    data = campy_ery_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_campy_ery[1], 
                      1/class_prop_campy_ery[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_campy_ery_s$prediction.error
  
}

# campy_source_predictors erythromycin  
# best parameters: mtry =  1, ntree = 500





# hyperparameter tuning

# CAMPY CIPROFLOXACIN MODELS

m <- ncol(campy_cip_train) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

#create grid with 3 values for mtry
hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)






# gene + source
set.seed(1)

class_prop_campy_cip <- as.vector(prop.table(table(campy_cip_train$ciprofloxacin)))

for(i in 1:nrow(hyper_grid)) {
  
  rf_model_campy_cip <- ranger(
    formula = ciprofloxacin ~ .,
    data = campy_cip_train,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_campy_cip[1], 
                      1/class_prop_campy_cip[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_campy_cip$prediction.error
  
}

# campy_all_predictors ciprofloxacin  
# best parameters: mtry = 5, ntree = 1000






# source only 
campy_cip_train_source <- campy_cip_train[, -c(3:4, 7:15)]

m <- ncol(campy_cip_train_source) - 1
mtry1 <- floor(sqrt(m))
mtry2 <- floor(m/3)
mtry3 <- floor(m/2)

hyper_grid <- expand.grid(
  mtry = c(mtry1, mtry2, mtry3),
  ntree = c(250, 500, 1000),
  OOB_Error = 0
)







# source
set.seed(1)


for(i in 1:nrow(hyper_grid)) {
  
  rf_model_campy_cip_s <- ranger(
    formula = ciprofloxacin ~ .,
    data = campy_cip_train_source,
    mtry = hyper_grid$mtry[i],
    num.trees = hyper_grid$ntree[i],
    importance = "impurity",
    class.weights = c(1/class_prop_campy_cip[1], 
                      1/class_prop_campy_cip[2])
  )
  
  
  hyper_grid$OOB_Error[i] <- rf_model_campy_cip_s$prediction.error
  
}

# campy_source_predictors ciprofloxacin  
# best parameters: mtry =  1, ntree = 250



