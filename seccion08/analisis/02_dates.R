#operaciones con fechas 
#EPOCH: 01 de enero de 1970

library(tidyverse)

Sys.Date() 


#Año dos digitos

as.Date("1/1/80", format = "%m/%d/%y")

#Año cuatro digitos

as.Date("1/1/1980", format = "%m/%d/%Y")
