#Clasification_Trees
#Arboles de Clasificación

library(tidyverse)
library(caret)
library(rpart)
library(rpart.plot)

banknote <- read_csv("seccion05/data/banknote-authentication.csv")

banknote

set.seed(2018)

indice_banknote <- createDataPartition(banknote$class, p = 0.7, list = FALSE)

mod <- rpart(class~., data = banknote[indice_banknote,], 
             method = "class", 
             control = rpart.control(minsplit = 20, cp = 0.01))

mod

prp(mod, type = 2, extra = 104, nn = TRUE, 
    fallen.leaves = TRUE, faclen = 4, varlen = 8, 
    shadow.col = "gray")


mod$cptable

mod_pruned <- prune(mod, mod$cptable[6, "CP"])

prp(mod_pruned, type = 2, extra = 104, nn = TRUE, 
    fallen.leaves = TRUE, faclen = 4, varlen = 8, 
    shadow.col = "gray")


predited_pruned <- predict(mod_pruned, banknote[-indice_banknote, ], type = "class")


table(banknote[-indice_banknote, ]$class, predited_pruned, dnn = c("Actual", "Predicho"))


pred_pruned02 <- predict(mod_pruned, banknote[-indice_banknote,], type = "prob")

head(predicted)
head(pred_pruned02)

library(ROCR)

pred <- prediction(pred_pruned02[,2], banknote[-indice_banknote, "class"])

perf <- performance(pred, "tpr", "fpr")

plot(perf)


