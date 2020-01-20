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

housing_data$rad <- NULL

drops <- c("rad", "ptratio")

housing_data_3 <- housing_data[,!(names(housing_data) %in% drops)]
