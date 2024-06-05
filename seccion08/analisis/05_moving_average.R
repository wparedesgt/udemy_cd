#

library(forecast)

s <- read.csv("seccion08/data/ts-example.csv")

#son 7 porque son datos semanales 
n <- 7

plot(s$sales, type = "l")

peso  <- rep(1/n, n)


s_fil_1 <- filter(s$sales, peso, sides = 2)

lines(s_fil_1, col = "blue", lwd = 3)


s_fil_2 <- filter(s$sales, filter = peso, sides = 1)
lines(s_fil_2, col = "red", lwd = 3)

#filtrar anualmente

n <- 12

prices <- read.csv("seccion08/data/prices.csv")


prices_ts <- ts(prices, c(1980,1), frequency = 12)




gas_f_1 <- filter(prices_ts[,2], filter = rep(1/n,n), sides = 2)
gas_f_2 <- filter(prices_ts[,2], filter = rep(1/n,n), sides = 1)

plot(prices_ts[,2])
lines(gas_f_1, col = "blue", lwd = 3)
lines(gas_f_2, col = "red", lwd = 3)

