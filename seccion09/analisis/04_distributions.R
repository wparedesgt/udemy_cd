##Distribution Plots

library(tidyverse)

geiser <- read_csv("seccion09/data/geiser.csv")

head(geiser)


plotwp <- geiser %>% ggplot(aes(waiting))

plotwp + geom_histogram()

plotwp + geom_histogram(binwidth = 5, fill = "white", colour = "black")


geiser %>% ggplot(aes(waiting, ..density..)) + 
  geom_histogram(fill = "cornsilk", color = "grey60", size = 0.2) +
  geom_density() + xlim(35,105)


geiser %>% ggplot(aes(eruptions, ..density..)) + 
  geom_histogram(fill = "cornsilk", color = "grey60", size = 0.2) +
  geom_density() + xlim(0,7)

