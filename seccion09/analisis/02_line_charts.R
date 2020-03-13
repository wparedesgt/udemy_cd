#Line Charts

library(tidyverse)

mtcars <- read_csv("seccion09/data/mtcars.csv")

head(mtcars)

plotwp <- mtcars %>% ggplot(aes(wt, mpg))

plotwp + geom_line()

plotwp + geom_line(linetype = "dashed")

plotwp + geom_line(color = "red")

plotwp + geom_line(aes(color = as.factor(carb)))
