#Clustering jerarquico y dendograma

library(tidyverse)
library(cluster)

protein <- read_csv("seccion07/data/protein.csv")

datos <- as.data.frame(scale(protein[,-1]))

datos$country <- protein$Country

datos

rownames(datos) <- datos$country

hc <- hclust(dist(datos, method = "euclidean"), method = "ward.D2")

hc

plot(hc, hang = -0.01, cex = 0.7)

fit <- cutree(hc, k = 4)

table(fit)

rect.hclust(hc, k = 4, border = "red")


hc2 <- hclust(dist(datos, method = "euclidean"), method = "single")

plot(hc2, hang = -0.01, cex = 0.7)


hc3 <- hclust(dist(datos, method = "euclidean"), method = "complete")

plot(hc3, hang = -0.01, cex = 0.7)


hc4 <- hclust(dist(datos, method = "euclidean"), method = "average")

plot(hc4, hang = -0.01, cex = 0.7)

hc4$merge

d <- dist(datos, method = "euclidean")

d

alb <- datos["Albania", -10]
aus <- datos["Austria", - 10]

#Asi se calculan las distancias euclideas
sqrt(sum(alb-aus)^2)


#Clustering divistivo

dv <- diana(datos, metric = "euclidean")

plot(dv)



