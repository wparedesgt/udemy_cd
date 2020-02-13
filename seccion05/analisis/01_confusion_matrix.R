#Matrices de Confusion

library(tidyverse)
library(caret)

cp <- read.csv("seccion05/data/college-perf.csv")

str(cp)
head(cp)

cp$Perf <- ordered(cp$Perf, levels = c("Low", "Medium", "High"))

cp$Pred <- ordered(cp$Pred, levels = c("Low", "Medium", "High"))


table01 <- table(cp$Perf, cp$Pred, dnn = c("Actual", "Predecido"))

table01

#Proporcional

prop.table(table01)

round(prop.table(table01, 1)*100,2)

round(prop.table(table01, 2)*100,2)


confusionMatrix(table01)
