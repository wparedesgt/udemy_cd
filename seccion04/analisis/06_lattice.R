
library(tidyverse)
library(lattice)

auto <- read.csv("seccion04/data/auto-mpg.csv", stringsAsFactors = FALSE)
head(auto)

auto$cylinders <-factor(auto$cylinders, 
                        levels = c(3,4,5,6,8),
                        labels = c("3cil", "4cil", "5cil", "6cil", "8cil"))

str(auto)
cat(auto$mpg)

attach(auto)