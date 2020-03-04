#Clustering basados en densidades

library(tidyverse)
library(factoextra)
library(fpc)
library(mclust)

data("multishapes")

par(mfrow=c(1,1))

dataPoints <- multishapes[,1:2]

plot(dataPoints)


km <- kmeans(dataPoints, 5)

fviz_cluster(km, data = dataPoints)

dsfit <- dbscan(dataPoints, eps = 0.15, MinPts = 5)

dsfit

fviz_cluster(dsfit, dataPoints, geom = "point")


mclust <- Mclust(dataPoints)

plot(mclust)

summary(mclust)
