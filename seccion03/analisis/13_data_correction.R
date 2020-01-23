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

crime_data03 <- crime_data %>% gather(key = "Crime Type", 
                                      value = "Arrest_estimate", 
                                      Murder, Assault)
head(crime_data03)


#Funcion Spread

crime_data04 <- crime_data02 %>% spread(key = "crime_type", 
                                        value = "arrest_estimate")

crime_data04

crime_data05 <- crime_data %>% unite(col = "Murder_Assault", 
                                     Murder, Assault, 
                                     sep = "_")
head(crime_data05)

crime_data06 <- crime_data05 %>% separate(col = "Murder_Assault", 
                                          into = c("Murder", "Assault"), 
                                          sep = "_")

head(crime_data06)
