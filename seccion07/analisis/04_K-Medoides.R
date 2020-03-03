#k_medoides

library(tidyverse)
library(caret)
library(cluster)
library(factoextra)

protein <- read.csv("seccion07/data/protein.csv")

rownames(protein) <- protein$Country
protein$Country <- NULL

protein_scaled <- as.data.frame(scale(protein))

km <- pam(protein_scaled, 4)

km


fviz_cluster(km)


#Clustering Large Aplications (clara)

clarafit <- clara(protein_scaled, 4, samples = 6)

clarafit


fviz_cluster(clarafit)
