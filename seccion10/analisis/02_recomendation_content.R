#Sistemas Basados en Contenido

library(tidyverse)
library(lsa)

mtcars <- read_csv("seccion10/data/mtcars.csv")

head(mtcars)

mtcars$X1 <- NULL


## Distancia Euclidea


