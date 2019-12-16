library(tidyverse)
library(jsonlite)


dat_1 <- fromJSON("seccion03/data/students.json")
dat_2 <- fromJSON("seccion03/data/student-courses.json")


dat_2 %>% head()
dat_1 %>% head()

#url <- "https://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json"

url <- "http://www.floatrates.com/daily/usd.json"



dat_3 <- fromJSON(url)

tc_gt <- dat_3$gtq$rate
tc_gt

dat_1 %>% head()

dat_2 %>% head(2)

dat_1$Email %>% head()

dat_1[c(2,5,8),]
dat_1[,c(2,5)]

#toJSON() convierte un dataframe a json



