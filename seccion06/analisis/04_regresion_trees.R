#arboles de Regresion

library(rpart)
library(tidyverse)
library(rpart.plot)
library(caret)
library(ipred)

#set.seed(2018, sample.kind = "Rounding")

bh <- read_csv("seccion06/data/BostonHousing.csv")

index_bh <- createDataPartition(bh$MEDV, p = 0.7, list = FALSE)

bfit <- rpart(MEDV ~., data = bh[index_bh,])

bfit

prp(bfit, type = 2, nn = TRUE, 
    fallen.leaves = TRUE, faclen = 4,
    varlen = 8, shadow.col = "gray")

bfit$cptable

plotcp(bfit)


bfitpruned <- prune(bfit, cp = 0.03400546)


prp(bfitpruned, type = 2, nn = TRUE, 
    fallen.leaves = TRUE, faclen = 4,
    varlen = 8, shadow.col = "gray")

preds <- predict(bfitpruned, bh[-index_bh,]) 

sqrt(mean((preds - bh[-index_bh,]$MEDV)^2))


#Predictores Categoricos

ed <- read_csv("seccion06/data/education.csv")

ed$region <- factor(ed$region)

index_ed <- createDataPartition(ed$expense, p = 0.7, list = FALSE)

edfit <- rpart(expense ~ region + urban + income + under18, data = ed[index_ed,])

prp(edfit, type = 2, nn = TRUE, 
    fallen.leaves = TRUE, faclen = 4,
    varlen = 8, shadow.col = "gray")


#Bagging 

bh <- read_csv("seccion06/data/BostonHousing.csv")

index_bh <- createDataPartition(bh$MEDV, p = 0.7, list = FALSE)

bagging_fit <- bagging(MEDV~., data = bh[index_bh,])

prediction_train <- predict(bagging_fit, bh[index_bh,])

sqrt(mean((prediction_train-bh[index_bh,]$MEDV)^2))

prediction_val <- predict(bagging_fit, bh[-index_bh,])

sqrt(mean((prediction_val-bh[-index_bh,]$MEDV)^2))


#Boosting

library(gbm)

bh <- read_csv("seccion06/data/BostonHousing.csv")
index_bh <- createDataPartition(bh$MEDV, p = 0.7, list = FALSE)

gbm_fit <- gbm(MEDV~., data = bh[index_bh,], distribution = "gaussian")

