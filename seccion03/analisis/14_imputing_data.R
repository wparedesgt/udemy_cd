#14
library(tidyverse)
library(mice)

housing_data <- read_csv("seccion03/data/housing-with-missing-value.csv")

housing_data

columns <- c("ptratio", "rad")

imputed_data <- housing_data[,names(housing_data) %in% columns] %>% 
  mice(m = 5,
       maxit = 50, 
       method = "pmm", 
       seed = 2018)

imputed_data$imp$ptratio

## Modelos sujeridos pmm -comparacion predictiva de medias
## logreg - Regresion logistica
## Polyreg - Regresion logistica politomico
## polr - modelo de  probabilidades proporcionales

summary(imputed_data)

complete_data <- mice::complete(imputed_data)

head(complete_data)


housing_data$ptratio <- complete_data$ptratio
housing_data$rad <- complete_data$rad

anyNA(housing_data)

#Usando otro metodo leyendo nuevamente el csv

library(Hmisc)

housing_data <- read_csv("seccion03/data/housing-with-missing-value.csv")

impute_arg <- aregImpute(~ptratio + rad, data = housing_data, n.impute = 5)

impute_arg

impute_arg$imputed$rad
impute_arg$imputed$ptratio


