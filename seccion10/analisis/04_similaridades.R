#Similaridades

#library(tidyverse)
library(lsa)

mtcars <- read.csv("seccion10/data/mtcars.csv")

head(mtcars)

mtcars$X <- NULL


## Distancia Euclidea

carro01 <- mtcars[1,]
carro02 <- mtcars[2,]

sqrt(sum((carro01-carro02)*(carro01-carro02)))

dist(c(carro01, carro02), method = "euclidean")

dis
