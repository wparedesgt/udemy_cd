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

#Interpretacion las aristas 

E(g)
E(dg)

plot.igraph(g)
neighbors(g,1)
neighbors(bg, "u3")

#Interpretacion de los vertices

V(g)

V(bg)$name[neighbors(bg, "g3")]

neighbors(g, 1, 1)
neighborhood(g, 2,1 )
neighborhood(g, order = 2, nodes = 1)

# agregando nodos

new.g <- g + vertex(27,28)
plot.igraph(new.g)
new.g <- new.g + edge(27,28)
plot.igraph(new.g)

#Agregando vetices

new.g <- new.g + vertex(28,30,31)
plot.igraph(new.g)

#Borrando los vertices

new.g <- delete.vertices(new.g, V(new.g) == 0)
plot.igraph(new.g)

#Borrando vertice que no existe

new.g <- delete.vertices(new.g, 1)

plot.igraph(new.g)

#Subgrafo inducido


g_sub <- induced.subgraph(g, c(3,6,8,9,15,21))

plot.igraph(g_sub)

