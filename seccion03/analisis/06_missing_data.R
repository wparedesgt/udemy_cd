library(tidyverse)

datos_perdidos <- read_csv("seccion03/data/missing-data.csv")

class(datos_perdidos)
str(datos_perdidos)
summary(datos_perdidos)
dim(datos_perdidos)
names(datos_perdidos)
datos_perdidos %>% head()
datos_perdidos %>% tail()
ncol(datos_perdidos)
nrow(datos_perdidos)
length(datos_perdidos)
View(datos_perdidos)

data_clean <- na.omit(datos_perdidos)

View(data_clean)

is.na(datos_perdidos[4,2])
is.na(datos_perdidos$Income)

#limpiar Na de una variable
data_income_cleaned <- datos_perdidos[!is.na(datos_perdidos$Income),]

data_income_cleaned

#Filas completas de dataframe
complete.cases(datos_perdidos)

data_clean2 <- datos_perdidos[complete.cases(datos_perdidos),]


#Convertir 0 en na

datos_perdidos$Income[datos_perdidos$Income == 0] <- NA

datos_perdidos$Income[datos_perdidos$Income == 0]

#Medidas de centralizacion y disperción.

mean(datos_perdidos$Income, na.rm = TRUE)

sd(datos_perdidos$Income, na.rm = TRUE)

