#Subconjuntos

library(tidyverse)
library(modeest)
library(raster)
library(moments)


datos <- read_csv("seccion04/data/auto-mpg.csv")

#Index por posicion

datos[1:5, 8:9]
datos[1:5, c(8,9)]

#Indice por nombre

datos[1:5, c("model_year", "car_name")]

##Minimo y maximo de MPG

## & and
## | or
## ! not
## == equal

datos[datos$mpg == max(datos$mpg) | datos$mpg == min(datos$mpg),]


#Filtros con condiciones

datos[datos$mpg > 30 & datos$cylinders == 6, c("car_name", "mpg")]

datos[datos$mpg > 30 & datos$cylinders == 6, c("car_name", "mpg")]

#subset

subset(datos, mpg > 30 & cylinders == 6, select = c("car_name", "mpg"))

## excluir columnas

datos[1:5, c(-1, -9)]
datos[1:5, -c(1,9)]
#datos[1:5, -c("No", "car_name")]
datos[1:5, !names(datos) %in% c("No", "car_name")]
datos[datos$mpg %in% c(15,20), c("car_name", "mpg")]
datos[1:2, c(F,F,T, T, T, T, T, T,F )]


