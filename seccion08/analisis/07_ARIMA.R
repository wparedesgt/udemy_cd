#Metodo ARIMA 

library(tidyverse)
library(forecast)

inf <- read_csv("seccion08/data/infy-monthly.csv")

inf_ts <- ts(inf$`Adj Close`, start = c(1999,3), frequency = 12)

inf_arima <- auto.arima(inf_ts)

summary(inf_arima)

plot(inf_arima)

inf_fore <- forecast(inf_arima, h= 12)

plot(inf_fore, col = "red", 
     fcol = "green")
