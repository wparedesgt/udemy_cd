#Mosaic Plot

library(tidyverse)
library(stats)

mtcars <- read_csv("seccion09/data/mtcars.csv")

head(mtcars)

mosaicplot(~ gear + carb, data = mtcars, color = 2:5, las = 1)
