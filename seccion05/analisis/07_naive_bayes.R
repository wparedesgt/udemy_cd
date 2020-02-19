#Naive Bayes

library(tidyverse)
library(naivebayes)
library(e1071)
library(caret)

ep <- read.csv("seccion05/data/electronics-purchase.csv")

set.seed(2018, sample.kind = "rounding")

index_ep <- createDataPartition(ep$Purchase, p = 0.67, list = FALSE)

mod <- naivebayes::naiveBayes(Purchase ~ ., data = ep[index_ep,])

mod
