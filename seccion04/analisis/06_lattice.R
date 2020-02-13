
library(tidyverse)
library(lattice)

auto <- read.csv("seccion04/data/auto-mpg.csv", stringsAsFactors = FALSE)
head(auto)

auto$cylinders <-factor(auto$cylinders, 
                        levels = c(3,4,5,6,8),
                        labels = c("3cil", "4cil", "5cil", "6cil", "8cil"))

#boxplot

bwplot(~auto$mpg | auto$cylinders, 
       main = "MPG segun Cilindros", 
       xlab = "Millas por Galon", 
       layout = c(2,3), 
       aspect = 1)

#scaterplot

xyplot(mpg~weight | cylinders, data = auto,
                main = "Peso vrs Consumo, Vrs Cilindros", 
                xlab = "Peso", 
                ylab = "Consumo (MPG)")

##Densityplot, splom

trellis.par.set(theme = col.whitebg())


