#k-means
#devtools::install_github("kassambara/factoextra") Instala el factoextra

library(tidyverse)
library(devtools)
library(factoextra)

protein <- read.csv("seccion07/data/protein.csv")

rownames(protein) <- protein$Country
protein$Country <- NULL

protein_scaled <- as.data.frame(scale(protein))



km <- kmeans(protein_scaled,4)
km

aggregate(protein_scaled, by = list(cluster = km$cluster), mean)

fviz_cluster(km, data = protein_scaled)

