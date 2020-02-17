#Diagrama ROC

#Caracteristicas operativas del receptor

library(tidyverse)
library(ROCR)

datos01 <- read_csv("seccion05/data/roc-example-1.csv")
datos02 <- read_csv("seccion05/data/roc-example-2.csv")

datos01
datos02

# 0 es fallo y 1 es exito

pred01 <- prediction(datos01$prob, datos01$class)
perf01 <- performance(pred01, "tpr", "fpr")

plot(perf01)

lines(par()$usr[1:2], par()$usr[3:4])

prop_cuts01 <- data.frame(cut = perf01@alpha.values[[1]], 
                          fpr = perf01@x.values[[1]], 
                          tpr = perf01@y.values[[1]])

prop_cuts01

tail(prop_cuts01)

prop_cuts01[prop_cuts01$tpr >= 0.8,]


pred02 <- prediction(datos02$prob, datos02$class, label.ordering = c("non-buyer", "buyer"))

perf02 <- performance(pred02, "tpr", "fpr")

plot(perf02)
lines(par()$usr[1:2], par()$usr[3:4])
