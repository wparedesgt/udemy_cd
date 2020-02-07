#Particiones

library(tidyverse)
library(caret)

datos <- read_csv("seccion04/data/BostonHousing.csv")

index_housing <- createDataPartition(datos$MEDV, p = 0.8, list = FALSE)

datos_train <- datos[index_housing,]
datos_test  <- datos[-index_housing,]

datos_index01 <- createDataPartition(datos$MEDV, p = 0.7, list = FALSE)

datos_train02 <- datos[datos_index01,]
datos_test02 <- datos[-datos_index01,]

validacion_ids02 <- createDataPartition(datos_test02$MEDV, p = 0.5, list = FALSE)
datos_validation <- datos_test02[validacion_ids02,]
datos_testing <- datos_test02[-validacion_ids02,]
