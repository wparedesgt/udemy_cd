library(tidyverse)

wmt <- read_csv("seccion08/data/WMT.csv")

plot(wmt$`Adj Close`, type = "l")

d <- diff(wmt$`Adj Close`)

head(d)

plot(d, type = "l")

hist(d, probability = TRUE, ylim = c(0, 0.8), breacks = 30,  main = "Walmart Stoks", col = "green")
lines(density(d), lwd = 3)


wmtm <- read_csv("seccion08/data/WMT-monthly.csv")

wmtm_ts <- ts(wmtm$`Adj Close`)

d <- diff(as.numeric(wmtm_ts))

wmt_m_return <- d / lag(as.numeric(wmtm_ts), k = -1)

hist(wmt_m_return, probability = TRUE, col = "blue")

