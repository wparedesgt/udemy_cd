#Forecasting

library(forecast)
library(tidyverse)

inf <- read_csv("seccion08/data/infy-monthly.csv")
head(inf)
tail(inf)

inf_ts <- ts(inf$`Adj Close`, start = c(1999,3), frequency = 12)
inf_ts

plot(inf_ts)

inf_hw <- HoltWinters(inf_ts)

head(inf_hw)

plot(inf_hw, col = "blue", col.predicted = "red")

inf_hw$SSE

#Valores del filtro expotencial alpha, beta, gamma

inf_hw$alpha
inf_hw$beta
inf_hw$gamma

#Valores Ajustados

head(inf_hw$fitted)

infy_fore <- forecast(inf_hw, h = 24)

plot(infy_fore)


