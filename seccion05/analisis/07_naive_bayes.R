#Naive Bayes

library(tidyverse)
#library(naivebayes)
library(e1071)
library(caret)

ep <- read.csv("seccion05/data/electronics-purchase.csv")

set.seed(2018, sample.kind = "rounding")

index_ep <- createDataPartition(ep$Purchase, p = 0.67, list = FALSE)

mod <- e1071::naiveBayes(Purchase ~ ., data = ep[index_ep,])

mod

pred <- predict(mod, ep[-index_ep,])

tab <- table(ep[-index_ep,]$Purchase, pred, dnn = c("Actual", "Predicha"))

confusionMatrix(tab)
