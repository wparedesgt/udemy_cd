#Operaciones Vectorizadas

library(tidyverse)

names_first <-c("William", "Zach", "Jack", "Sansa") 
names_last <- c("Shatner", "Effran", "Sparrow", "Stark")

paste(names_first, names_last)

single_surname <- c("Zuccherberg")

#La funcion paste combina incluso vectores de distinto tamaño

paste(names_first, single_surname)


#Generar nombres de usuario

username <- function(primero, segundo){
  tolower(paste0(segundo, substr(primero, 1, 1)))
}

username(names_first, names_last)


auto <- read_csv("seccion12/data/auto-mpg.csv")

auto$dmpg <- auto$mpg * 2.0

auto$kmpg <- auto$mpg * 1.609

head(auto)
sum(auto$mpg)
min(auto$mpg)
max(auto$mpg)
range(auto$mpg)
prod(auto$mpg)

mean(auto$mpg)
median(auto$mpg)
var(auto$mpg)
sd(auto$mpg)


