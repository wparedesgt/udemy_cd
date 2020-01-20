library(tidyverse)

housing_data <- read.csv("seccion03/data/housing-with-missing-value.csv",header = TRUE, stringsAsFactors = FALSE)

head(housing_data)

summary(housing_data)

housing_data_1 <- na.omit(housing_data)

summary(housing_data_1)

#Eliminar NA de ciertas columnas

drop_na <- c("rad")
housing_data_2 <- housing_data[complete.cases(housing_data[,!(names(housing_data)) %in% drop_na]),]

summary(housing_data_2)

#Eliminar la columna

#housing_data$rad <- NULL

drops <- c("rad", "ptratio")

housing_data_3 <- housing_data[,!(names(housing_data) %in% drops)]

#Libreria

library(Hmisc)

#Reemplazar los NA por otros valores conocidos

housing_data_copy01 <- housing_data

housing_data_copy01$ptratio <- impute(housing_data_copy01$ptratio, mean)
housing_data_copy01$rad <- impute(housing_data_copy01$rad, mean)

summary(housing_data_copy01)

housing_data_copy02 <- housing_data

housing_data_copy02$ptratio <- impute(housing_data_copy02$ptratio, median)
housing_data_copy02$rad <- impute(housing_data_copy02$rad, median)

summary(housing_data_copy02)

#Libreria mice

library(mice)

md.pattern(housing_data)


#Libreria VIM

library(VIM)

aggr(housing_data, 
     col = c("green", "red"), 
     numbers = TRUE, sortVars = TRUE, 
     labels = names(housing_data), 
     cex.axis = 0.7, 
     gap = 1, 
     ylab = c("Histograma de NAs", "Patron"))
