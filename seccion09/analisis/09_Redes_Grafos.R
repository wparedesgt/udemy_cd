#Graficos en Forma de Red

library(tidyverse)
library(igraph)


g_dir <- graph(edges = c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6,5,6), n = 6)
g_n_dir <- graph(edges = c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6,5,6), n = 6, directed = FALSE)

par(mfrow = c(1,2))

plot(g_dir)

plot(g_n_dir)
