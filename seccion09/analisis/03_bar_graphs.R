#Barchar 

library(tidyverse)

bike <- read_csv("seccion09/data/daily-bike-rentals.csv")

bike$season <- factor(bike$season, 
                      levels = c(1,2,3,4),
                      labels = c("Invierno", "Primavera", "Verano", "Otoño"))

bike$workingday <- factor(bike$workingday, 
                          levels = c(0,1), 
                          labels = c("Dia Libre", "Dia Trabajo"))

bike$weathersit <- factor(bike$weathersit, 
                          levels = c(1,2,3),
                          labels = c("Buen tiempo", "Dia nublado", "Mal tiempo"))

bike_sum <- bike %>% 
  group_by(season, workingday) %>% 
  summarize(rental = sum(cnt))

bike_sum

bike_sum %>% ggplot(aes(x = season, y = rental, fill = workingday, label = scales::comma(rental))) +
  geom_bar(show.legend = TRUE, stat = "identity", fill = "lightblue", colour = "black") +
  labs(title = "Alquileres por estacion por dia") + 
  scale_y_continuous(labels = scales::comma) + 
  geom_text(size = 3, position = position_stack(vjust = 0.5))


