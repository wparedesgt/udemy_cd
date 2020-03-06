#Informacion Financiera

library(tidyverse)
library(quantmod)

AMZN <- read_csv("seccion08/data/AMZN.csv")
AAPL <- read_csv("seccion08/data/AAPL.csv")
FB <- read_csv("seccion08/data/FB.csv")
GOOG <- read_csv("seccion08/data/GOOG.csv")


AMZN <- AMZN[AMZN$Date >= '2008-01-01',]
GOOG <- GOOG[GOOG$Date >= '2008-01-01',]
AAPL <- AAPL[AAPL$Date >= '2008-01-01',]

str(AAPL)


AAPL %>% ggplot(aes(Date, Close)) + geom_line(aes(color = "Apple")) +
  geom_line(data = AMZN, aes(color = "Amazon")) +
  geom_line(data = FB, aes(color = "Facebook")) + 
  geom_line(data = GOOG, aes(color = "Google")) +
  labs(color = "Legend") +
  scale_color_manual("", breaks = c("Apple", "Amazon", "Facebook", "Google"), 
                     values = c("green", "yellow", "blue", "red"))+
  ggtitle("Comparaciones de Cierre") + theme(plot.title = element_text(lineheight = 0.7, face = "bold"))


## carga de datos en tiempo real

getSymbols("AAPL")
getSymbols("NFLX")
barChart(AAPL)
barChart(NFLX)

chartSeries(AAPL, TA = "NULL")

chartSeries(AAPL$AAPL.Close, TA = "addMACD()")

chartSeries(NFLX)
