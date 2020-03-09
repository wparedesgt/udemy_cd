#Serie Temporal

library(tidyverse)

datos <- read_csv("seccion08/data/ts-example.csv")

datos

datos_ts <- ts(datos)


head(datos_ts)

plot(datos_ts)


s_ts_a <- ts(datos, start = 2001)

plot (s_ts_a)

s_ts_m <- ts(datos, start = c(2001,1), frequency = 12)

plot(s_ts_m)


s_ts_q <- ts(datos, start = 2001, frequency = 4)

plot(s_ts_q)


start(s_ts_m)
end(s_ts_m)

frequency(s_ts_m)

prices <- read.csv("seccion08/data/prices.csv")

head(prices)

prices_ts <- ts(prices, c(1980,1), frequency = 12)

plot(prices_ts)


plot(prices_ts, plot.type = "single", col = 1:2)
legend("topleft", colnames(prices_ts), col = 1:2, lty = 1)
