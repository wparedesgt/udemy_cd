#Knn

library(tidyverse)
library(caret)
library(class)

vac <- read.csv("seccion05/data/vacation-trip-classification.csv")

vac

vac$income_z <- scale(vac$Income)
vac$Family_size_z <- scale(vac$Family_size)

set.seed(2018, sample.kind = "Rounding")

t_ids <- createDataPartition(vac$Result, p = 0.5, list = FALSE)

train <- vac[t_ids,]
temp <- vac[-t_ids,]
v_ids <- createDataPartition(temp$Result, p = 0.5, list = FALSE)
val <- temp[v_ids,]
test <- temp[-v_ids,]

pred01 <- knn(train[,4:5], val[,4:5], train[,3], k = 5)

errmat01 <- table(val$Result, pred01, dnn = c("Actual", "Predichos"))

errmat01

pred02 <- knn(train[,4:5], test[,4:5], train[,3], k = 1)

errmat02 <- table(test$Result, pred02, dnn = c("Actual", "Predicho"))

errmat02

#Algoritmo manual

knn_automate <- function(tr_predictors, val_predictors, tr_target, val_target, start_k, end_k){
  for(k in start_k:end_k){
    pred <- knn(tr_predictors, val_predictors, tr_target, k)
    tab <- table(val_target, pred, dnn = c("Actual", "Predicho"))
    cat(paste("Matriz de Confusion para k =", k, "/n"))
    cat("=========================/n")
    print(tab)
    cat("------------------/n")
    
  }
}

knn_automate(train[,4:5], val[,4:5], train[,3],val[,3], 1,8)


trcntrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)

#Automatiza cual es el k vecino mas cercano.

caret_knn_fit <- train(Result ~ Family_size + Income, data = train, 
                       method = "knn", trControl = trcntrl, 
                       preProcess = c("center", "scale"), 
                       tuneLength = 10)


plot(caret_knn_fit)
caret_knn_fit

pred05 <- knn(train[,4:5], val[,4:5], train[,3], k = 5, prob = TRUE)

pred05

