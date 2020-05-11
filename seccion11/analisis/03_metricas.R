#Metricas

library(tidyverse)
library(igraph)

load("seccion11/data/bipartite-graph.Rdata")
load("seccion11/data/meetup-hiking-d-graph.Rdata")
load("seccion11/data/meetup-hiking-graph.Rdata")

degree(g)

plot.igraph(g)
plot.igraph(dg)
plot.igraph(bg, layout = layout.bipartite)

degree(bg, "g3")
degree(dg, 15, mode = "in")
degree(dg, 15, mode = "out")

degree.distribution(bg)

options(digits = 3)
degree.distribution(dg)

betweenness(g)
betweenness(bg, "g3")
betweenness(bg)

edge.betweenness(bg)
edge.betweenness(dg, 10)

closeness(dg, mode = "in")


closeness(bg)
