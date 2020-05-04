#igraph

library(igraph)

load("seccion11/data/meetup-hiking-edgelist.Rdata")

users_edgelist_filtered <-users_edgelist.upper[users_edgelist.upper$x > 15]


