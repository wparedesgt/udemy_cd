#Bosques Aleatorios

library(tidyverse)
library(randomForest)
library(caret)
library(ROCR)

banknote <- read.csv("seccion05/data/banknote-authentication.csv")

str(banknote)

banknote$class <- factor(banknote$class, )

str(banknote)

set.seed(2018, sample.kind = "Rounding")


index_banknote <- createDataPartition(banknote$class, p = 0.7, list = FALSE)

mod <- randomForest(x = banknote[index_banknote, 1:4], 
                    y = banknote[index_banknote, 5],
                    ntree = 500, 
                    keep.forest = TRUE)

pred <- predict(mod, banknote[-index_banknote,], type = "class")

table(banknote[-index_banknote, "class"], pred, dnn = c("Actual", "Predicho"))


probs <- predict(mod, banknote[-index_banknote,], type = "prob")

pred <- prediction(probs[,2], banknote[-index_banknote, "class"])

perf <- performance(pred, "tpr", "fpr")

plot(perf)
