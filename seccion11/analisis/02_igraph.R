#igraph

library(igraph)
library(tidyverse)

load("seccion11/data/meetup-hiking-edgelist.Rdata")

users_edgelist_filtered <- users_edgelist.upper %>% filter(users_edgelist.upper$x > 15)

nrow(users_edgelist_filtered)

head(users_edgelist_filtered)

uids <- unique(c(users_edgelist_filtered$i, users_edgelist_filtered$j))

i <- match(users_edgelist_filtered$i, uids)
j <- match(users_edgelist_filtered$j, uids)



new_graph <- data.frame(i, j, x = users_edgelist_filtered$x)

#Representar grafos

g <-  graph.data.frame(new_graph, directed = FALSE)
g

plot.igraph(g, vertex.size = 20)


plot.igraph(g, layout = layout.circle, vertex.size = 20)


plot.igraph(g, edge.curved = TRUE, vertex.color = "pink", edge.color = "blue")

#Redifiniendo los nodos

V(g)$size <- degree(g)*4

plot.igraph(g, edge.curved = TRUE,vertex.color = "pink", edge.color = "blue")

color <- ifelse(degree(g) >= 5, "red", "blue")

size <- degree(g)*4

plot.igraph(g, vertex.label = NA, 
            layout = layout.fruchterman.reingold, 
            vertex.color = color, 
            vertex.size = size)

#Aristas

E(g)$x  

plot.igraph(g, edge.curved = TRUE, edge.color = "black", 
            edge.width = (E(g)-min(E(g))+1)/5)
