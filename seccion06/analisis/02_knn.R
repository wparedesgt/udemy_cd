#knn
library(tidyverse)
library(FNN)
library(dummies)
library(scales)
library(caret)

edu <- read.csv("seccion06/data/education.csv")

dms <- dummy(edu$region, sep = "_")

edu <- cbind(edu, dms)

edu

edu$urban_s  <- rescale(edu$urban)
edu$income_s <- rescale(edu$income)
edu$under18_s <- rescale(edu$under18)

edu

set.seed(2018, sample.kind = "Rounding")

index_edu <- createDataPartition(edu$expense, p = 0.6, list = FALSE)

train <- edu[index_edu, ]
temp <- edu[-index_edu, ]
v_id <- createDataPartition(temp$expense, p = 0.5, list = FALSE)
val <- temp[v_id, ]
test <- temp[-v_id, ]

reg01 <- knn.reg(train[,7:12], val[,7:12], train$expense, k = 1, algorithm = "brut")


rmsefnc <- function(actual, predicho){
  return(sqrt(mean((actual-predicho)^2)))
}

rmse01 <- rmsefnc(reg01$pred, val$expense)
rmse01


reg02 <-  knn.reg(train[,7:12], val[,7:12], train$expense, k = 2, algorithm = "brut")

rmse02 <- rmsefnc(reg02$pred, val$expense)
rmse02

reg03 <- knn.reg(train[,7:12], val[,7:12], train$expense, k = 3, algorithm = "brut")

rmse03 <- rmsefnc(reg03$pred, val$expense)
rmse03

reg04 <- knn.reg(train[,7:12], val[,7:12], train$expense, k = 4, algorithm = "brut")

rmse04 <- rmsefnc(reg04$pred, val$expense)
rmse04

errors <- c(rmse01, rmse02, rmse03, rmse04)

plot(errors, type = 'o', xlab = "k", ylab = "RMSE" )


reg_test <- knn.reg(train[,7:12], test[,7:12], train$expense, k = 3, algorithm = "brut")

rmse_test <- rmsefnc(test$expense, reg_test$pred)
rmse_test


t_index <- createDataPartition(edu$expense, p = .70, list = FALSE)

tr <- edu[t_index,]
val <- edu[-t_index,]

reg <- knn.reg(tr[,7:12], test = NULL, y = tr$expense, 
               k = 3, algorithm = "brute")

rmse_reg <- sqrt(mean(reg$residuals^2))

rmse_reg


rdacb_knn_reg <- function(tr_predictors, val_predictors, tr_target, val_target, k) {
  res <- knn.reg(tr_predictors, val_predictors, 
                 tr_target, k, algorithm = "brute")
  rmserror <- sqrt(mean((val_target-res$pred)^2))
  cat(paste("RMSE para k=", toString(k), ": ", rmserror, "\n", sep = "" ))
  rmserror
}

rdacb_knn_reg(tr[,7:12], val[,7:12], 
              tr$expense, val$expense, 1)


rdacb_knn_reg(tr[,7:12], val[,7:12], 
              tr$expense, val$expense, 2)

rdacb_knn_reg(tr[,7:12], val[,7:12], 
              tr$expense, val$expense, 3)

rdacb_knn_reg(tr[,7:12], val[,7:12], 
              tr$expense, val$expense, 4)

rdacb_knn_reg_multi <- function(tr_predictors, val_predictors, tr_target, val_target, start_k, end_k) {
  rms_errors <- vector()
  for (k in start_k:end_k) {
    rms_error <- rdacb_knn_reg(tr_predictors, val_predictors, tr_target, val_target, k)
    
    rms_errors <- c(rms_errors, rms_error)
  }
  
  plot(rms_errors, type = 'o', xlab = "k", ylab = "RMSE")
  
}

#Cargar los datos de entrenamiento iniciales nuevamente

rdacb_knn_reg_multi(train[,7:12], val[, 7:12], train$expense, val$expense, 1,10)

df <- data.frame(actual = val$expense, pred = reg03$pred)

df

plot(df)
abline(0,1)
