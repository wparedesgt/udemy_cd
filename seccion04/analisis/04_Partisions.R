#Particiones

library(tidyverse)
library(caret)

#datos <- read_csv("seccion04/data/BostonHousing.csv")

datos <- read.csv("seccion04/data/BostonHousing.csv")

index_housing <- createDataPartition(datos$MEDV, p = 0.8, list = FALSE)

datos_train <- datos[index_housing,]
datos_test  <- datos[-index_housing,]

datos_index01 <- createDataPartition(datos$MEDV, p = 0.7, list = FALSE)

datos_train02 <- datos[datos_index01,]
datos_test02 <- datos[-datos_index01,]

validacion_ids02 <- createDataPartition(datos_test02$MEDV, p = 0.5, list = FALSE)
datos_validation <- datos_test02[validacion_ids02,]
datos_testing <- datos_test02[-validacion_ids02,]


#datos02 <-  read_csv("seccion04/data/boston-housing-classification.csv")

datos02 <-  read.csv("seccion04/data/boston-housing-classification.csv")

datos02$MEDV_CAT <- as.factor(datos02$MEDV_CAT)

str(datos02)

train_id03 <- createDataPartition(datos02$MEDV_CAT, p = 0.7, list = FALSE)
data_train03 <- datos02[train_id03,]
data_test02 <- datos02[-train_id03,]


rda_cb_partition02 <- function(dataframe, target_index, prob){
  library(caret)
  training_ids <- createDataPartition(dataframe[,target_index], p = prob, list = FALSE)
  list(train = dataframe[training_ids,], val = dataframe[-training_ids,])
}

rda_cb_partition03 <- function(dataframe, target_index, prob_train, prob_val){
  library(caret)
  training_ids <- createDataPartition(dataframe[,target_index], p =prob_train, list = FALSE)
  train <- dataframe[training_ids,]
  temp <- dataframe[-training_ids,]
  validation_ids <- createDataPartition(temp[, target_index], p = prob_val, list = FALSE)
  list(train = train, val = temp[validation_ids,], test = temp[-validation_ids,])
}


datos01 <- rda_cb_partition02(datos, 14, 0.8)
datos02 <- rda_cb_partition03(datos02, 14, 0.7, 0.5)

head(datos01$train)

head(datos02$train)

sample01 <- sample(datos$CRIM, 40, replace = FALSE)


sample01


