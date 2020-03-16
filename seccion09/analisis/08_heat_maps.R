#Mapa de Calor

library(tidyverse)
library(ggmap)
library(maps)

tartu_data <- read_csv2("seccion09/data/tartu_housing.csv")

head(tartu_data)

tartu_map <- get_map(location = "tartu", maptype = "satellite", zoom = 12)


#Ver mapas de calor en google