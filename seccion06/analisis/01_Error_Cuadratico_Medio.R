#Error Cuadratico Medio
#RMS


library(tidyverse)

datos <- read.csv("seccion06/data/rmse.csv")

head(datos)


rmse <- sqrt(mean((datos$price - datos$pred)^2))


plot(datos$price, datos$pred, xlab = "Actual", ylab = "Predicho")
abline(0,1)

rmsefnc <- function(actual, predicho){
  return(sqrt(mean((actual-predicho)^2)))
}

rmsefnc(datos$price, datos$pred)
