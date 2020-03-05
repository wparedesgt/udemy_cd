#Informacion Financiera

library(tidyverse)

AMZN <- read_csv("seccion08/data/AMZN.csv")
AAPL <- read_csv("seccion08/data/AAPL.csv")
FB <- read_csv("seccion08/data/FB.csv")
GOOG <- read_csv("seccion08/data/GOOG.csv")


AMZN <- AMZN[AMZN$Date >= '2008-01-01',]
GOOG <- GOOG[GOOG$Date >= '2008-01-01',]
AAPL <- AAPL[AAPL$Date >= '2008-01-01',]

str(AAPL)


AAPL %>% ggplot(aes(Date, Close)) + geom_line(aes(color = "Apple"))
