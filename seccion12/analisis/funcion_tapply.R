#funcion tapply

library(tidyverse)


auto <- read_csv("seccion12/data/auto-mpg.csv")

auto$cylinders <- factor(auto$cylinders, 
                         levels = c(3,4,5,6,8), 
                         labels = c("3C", "4C", "5C", "6C", "8C"))

tapply(auto$mpg, auto$cylinders, mean)

tapply(auto$mpg, list(cyl = auto$cylinders), mean)


by(auto, auto$cylinders,function(row){cor(row$mpg, row$acceleration)})
