#Maquinas de soporte Vectorial
library(e1071)
library(caret)
library(ROCR)
library(tidyverse)


banknote <- read.csv("seccion05/data/banknote-authentication.csv")

banknote$class <- factor(banknote$class)

set.seed(2018, sample.kind = "Rounding")

index_banknote <- createDataPartition(banknote$class, p = 0.7, list = FALSE)

mod <- svm(class ~ ., data = banknote[index_banknote,], class.weights = c("0" = 0.3, "1" = 0.7), cost = 1000)

table(banknote[index_banknote,"class"], fitted(mod), dnn = c("Actual", "Predicho"))

pred <- predict(mod, banknote[-index_banknote,])

table(banknote[-index_banknote,"class"], pred, dnn = c("Actual", "Predicho"))

plot(mod, data = banknote[index_banknote,], skew ~ variance)

plot(mod, data = banknote[-index_banknote,], skew ~ variance)

tuned <- tune.svm(class ~ ., data = banknote[index_banknote,], gamma = 10^(-6:-1), cost = 10^(1:2))

summary(tuned)
