#ramdom Forest
library(tidyverse)
library(randomForest)
library(caret)


bh <- read.csv("seccion06/data/BostonHousing.csv")

set.seed(2018, sample.kind = "Rounding")

index_bh <- createDataPartition(bh$MEDV, p = 0.7, list = FALSE)

mod <- randomForest(x = bh[index_bh, 1:13], y = bh[index_bh, 14], 
                    ntree = 1000, 
                    xtest = bh[-index_bh, 1:13], 
                    ytest = bh[-index_bh, 14], 
                    importance = TRUE, 
                    keep.forest = TRUE)

mod

mod$importance 

plot(bh[index_bh,]$MEDV, predict(mod, newdata = bh[index_bh,]), 
     xlab = "Actual", ylab = "Predichos")
abline(0,1)

plot(bh[-index_bh,]$MEDV, predict(mod, newdata = bh[-index_bh,]), 
     xlab = "Actual", ylab = "Predichos")
abline(0,1)


#mtry = m/3 m = numero de predictores
#nodesize = el minimo de tamaño de los nodos para ser considerados como minimo debe de ser 5
#maxnodes = numero maximo de nodos terminales 




