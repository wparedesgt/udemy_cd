#Analisis componentes principales

library(tidyverse)

data("USArrests")


names(USArrests)

head(USArrests)

USArrests %>% apply(2,var)

acp <- prcomp(USArrests, 
              center = TRUE, 
              scale. = TRUE)
acp

plot(acp, type = "l")

summary(acp)

biplot(acp, scale = 0)

pc1 <- apply(acp$rotation[,1]*USArrests, 1, sum)

pc1


pc2 <- apply(acp$rotation[,2]*USArrests, 1, sum)

pc2


USArrests$pc1 <- pc1
USArrests$pc2 <- pc2

USArrests

USArrests[,1:4] <- NULL

USArrests
