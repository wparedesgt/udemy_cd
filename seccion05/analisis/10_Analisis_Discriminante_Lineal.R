#Analisis discriminante lineal

library(tidyverse)
library(MASS)
library(caret)

bn <- read.csv("seccion05/data/banknote-authentication.csv")

bn$class <- factor(bn$class)


set.seed(2018, sample.kind = "Rounding")

index_bn <- createDataPartition(bn$class, p = 0.7, list = FALSE)

mod <- lda(bn[index_bn, 1:4], bn[index_bn, 5])

mod <- lda(class ~., data = bn[index_bn,])

bn[index_bn, "Pred"] <- predict(mod, bn[index_bn, 1:4])$class


table(bn[index_bn, "class"], bn[index_bn, "Pred"], dnn = c("Actual", "Predicho"))

bn[-index_bn, "Pred"] <- predict(mod, bn[-index_bn, 1:4])$class


table(bn[-index_bn, "class"], bn[-index_bn, "Pred"], dnn = c("Actual", "Predicho"))

bn
