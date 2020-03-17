#Graficos Multivariantes

library(tidyverse)
library(GGally)

bike <- read_csv("seccion09/data/daily-bike-rentals.csv")

bike$season <- factor(bike$season, 
                      levels = c(1,2,3,4), 
                      labels = c("Invierno", "Primavera", "Verano", "Otoño"))

bike$weathersit <- factor(bike$weathersit, 
                          levels = c(1,2,3), 
                          labels = c("Despejado", "Nublado", "Lluvia"))


bike$weekday <- factor(bike$weekday, 
                       levels = 0:6, 
                       labels = c("D","L", "M", "X", "J", "V", "S"))


hist(bike$windspeed)

bike$windspeed_fac <- cut(bike$windspeed, breaks = 3,
                          labels = c("Poco", "Medio", "Elevado"))

names(bike)

bike %>% ggplot(aes(temp, cnt)) +
  geom_point(size = 3, aes(color = factor(windspeed_fac))) +
  theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = FALSE, col = "red") +
  facet_grid(weekday ~ season)



auto <- read_csv("seccion09/data/auto-mpg.csv")

auto$cylinders <- factor(auto$cylinders, 
                         labels = c("3C", "4C", "5C", "6C", "8C"))

ggpairs(auto[,2:7], 
        aes(colour = cylinders, 
            alpha = 0.4), 
        title = "Analisis Multivariante", 
        upper = list(continuous = "density"), 
        lower = list(combo = "denstrip")) +
        theme(plot.title = element_text(hjust = 0.5))

 