#funciones lapply y sapply

library(tidyverse)

#Funcion lapply devuelve un objeto tipo lista, se puede aplicar a vectores, lista, data frame.

auto <- read_csv("seccion12/data/auto-mpg.csv")
head(auto)

x <- 1:3

x

lapply(x, sqrt)

x <- list(a = 1:10, b = c(1, 10, 100, 1000), c = seq(5,50, by = 5))

x

lapply(x, mean)

class(lapply(x, mean))

class(sapply(x, mean))

lapply(auto[,2:8], mean)
sapply(auto[,2:8], mean)


sapply(auto[,2:8], summary)


sapply(auto[,2:8], range)
