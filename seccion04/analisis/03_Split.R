#Split

library(tidyverse)

#split/unsplit

datos <- read_csv("seccion04/data/auto-mpg.csv")

carslist <- split(datos, datos$cylinders)
carslist[1]
carslist[[1]]
str(carslist[1])
str(carslist[[1]])
names(carslist[[1]])


