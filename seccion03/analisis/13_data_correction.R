library(tidyverse)

crime_data <- read_csv("seccion03/data/USArrests.csv")
crime_data
str(crime_data)
head(crime_data)

crime_data <- cbind(state = rownames(crime_data), crime_data)
head(crime_data)

crime_data01 <- crime_data  %>% gather(key = "crime_type", 
                       value = "arrest_estimate", 
                       Murder : UrbanPop)

head(crime_data01)

crime_data02 <- crime_data %>% gather(key = "crime_type", 
                                      value = "arrest_estimate", 
                                      -state)

head(crime_data02)

crime_data02
