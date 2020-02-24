#Redes Neuronales

library(tidyverse)
library(nnet)
library(caret)
library(ROCR)

bn <- read.csv("seccion05/data/banknote-authentication.csv")

bn$class <- factor(bn$class)

idx_bn <- createDataPartition(bn$class, p = 0.7, list = FALSE)

mod <- nnet(class ~ . , data = bn[idx_bn,], 
            size = 3, maxit = 10000, decay = .001, rang = 0.05, 
            na.action = na.omit, skip = TRUE)

#Rango por el maximo del valor absoluto de las variables debe de ser lo mas simimar a 1 

#rang * max(|variables|) ~1

apply(bn, 2, max)

pred <- predict(mod, newdata = bn[-idx_bn,], type = "class")

table(bn[-idx_bn,]$class, pred, dnn = c("Actual", "Predichos"))

pred2 <- predict(mod, newdata = bn[-idx_bn,], type = "raw")

perf <- performance(prediction(pred2, bn[-idx_bn,"class"]), "tpr", "fpr")

plot(perf)


