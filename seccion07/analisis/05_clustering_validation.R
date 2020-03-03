#Validando Clustering

library(tidyverse)
library(caret)
library(fpc)
library(NbClust)
library(factoextra)
library(cluster)



protein <- read.csv("seccion07/data/protein.csv")
rownames(protein) <- protein$Country
protein$Country <- NULL
protein_scaled <- as.data.frame(scale(protein))

nb <- NbClust(protein_scaled, distance = "euclidean", 
              min.nc = 2, max.nc = 12, 
              method = "ward.D2", index = "all")

fviz_nbclust(nb) + theme_minimal()

km_res <- kmeans(protein_scaled, 3)

sil_km <- silhouette(km_res$cluster, dist(protein_scaled))

sil_sum <- summary(sil_km)

sil_sum

fviz_silhouette(sil_km)

dd <- dist(protein_scaled, method = "euclidean")


km_stats <- cluster.stats(dd, km_res$cluster)

km_stats$within.cluster.ss
km_stats$clus.avg.silwidths
km_stats$dunn

kmed <- pam(protein_scaled, 3)
kmed_stats <- cluster.stats(dd, kmed$clustering)

kmed_stats$dunn

sil_kmed <- silhouette(kmed$clustering, 
                       dist(protein_scaled))

fviz_silhouette(sil_kmed)

fviz_cluster(km_res, data = protein_scaled)



