library(tidyverse)
library(modeest)
library(raster)
library(moments)


datos <- read_csv("seccion04/data/auto-mpg.csv")

datos

head(datos)
str(datos)

datos$cylinders <- factor(datos$cylinders, 
                          levels = c(3,4,5,6,8), 
                          labels = c("3cil", "4cil", "5cil", 
                                     "6cil", "8cil"))

datos
summary(datos)
str(datos)

X <- datos$mpg

##Medidas de Centralización

mean(X)
median(X)

#Calculando la moda, (valor mas frecuente)

mfv(X)

#Calculando el Quantile

quantile(X)

##Medidas de dispersion

#Varianza y despersion tipica - nunca puede ser negativa

var(X)

#Desviacion tipica Standard - conocido y positivo

sd(X)

#Coeficiente de variacion

cv(X)


##Medidas de Asimetria se basan en el calculo de momentos

#Asimetria de Fisher

skewness(X)

#curtosis

kurtosis(X)


hist(X)

