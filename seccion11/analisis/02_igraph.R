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

new_graph_w <- new.graph
names(new_graph_w) <- c("i", "j", "weight")
wg <- graph.data.frame(new_graph_w,  directed = FALSE)

E(g)$x  

plot.igraph(g, edge.curved = TRUE, edge.color = "black", 
            edge.width = (E(g)-min(E(g))+1)/5)

#Grafo dirigido 

dg <- graph.data.frame(new_graph, directed = T)

save(dg, file = "seccion11/data/meetup-hiking-d-graph.Rdata")

plot.igraph(dg, edge.curved = TRUE, edge.color = "black", 
            vertex.label.cex = 0.5)


#Grafos con pesos en las aristas


new_graph_w <- new_graph
names(new_graph_w) <- c("i", "j", "weight")
wg <- graph.data.frame(new_graph_w, directed = FALSE)
wg
E(wg)$weight
plot.igraph(wg, edge.label = E(wg)$weight)


#Obtener la matriz de adyacencia de un grafo


get.adjacency(g, type = "upper")
get.adjacency(g, type = "lower")
get.adjacency(g, type = "both")


get.adjacency(g, type = "both", attr = "x")

#Lista de aristas a partir de un grafo

get.data.frame(g)
get.data.frame(g, "vertices")
get.data.frame(g, "both")


#grafo bipartito

g1 <- rbinom(10,1, 0.5)
g2 <- rbinom(10,1, 0.5)
g3 <- rbinom(10,1, 0.5)
g4 <- rbinom(10,1, 0.5)
g5 <- rbinom(10,1, 0.5)

membership <- data.frame(g1,g2, g3, g4, g5)
names(membership)

rownames(membership) <- c("u1","u2", "u3", "u4", "u5", "u6","u7", "u8", "u9", "u10")

bg <- graph.incidence(membership)

bg

V(bg)$type

V(bg)$name

layout <- layout.bipartite(bg)

plot(bg, layout = layout, vertex.size = 15)


#Proyeccion de un grafo bipartito

p <- bipartite.projection(bg)

p


plot(p$proj1, vertex.size = 15)

plot(p$proj2, vertex.size = 20)
