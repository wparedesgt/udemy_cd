#Scatter_plots
#Graficos de Dispersion

library(tidyverse)

auto <- read_csv("seccion09/data/auto-mpg.csv")

auto$cylinders <- factor(auto$cylinders, 
                         labels = c("3C", "4C", "5C", "6C", "8C"))


head(auto)

plotwp <- auto %>% ggplot(aes(weight, mpg))

plotwp + geom_point()
plotwp + geom_point(alpha = 1/2, size = 5,
                    aes(color = factor(cylinders))) + geom_smooth(method = "lm", se = TRUE, col = "green") + facet_grid(cylinders ~.) + theme_bw(base_family = "Calibri", base_size = 10) + labs(x = "Peso") + labs(y = "Millas por Galon") + labs(title = "Consumo vrs Peso")


