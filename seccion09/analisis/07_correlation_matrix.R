#Correlation Matrix

library(tidyverse)
library(corrplot)


mtcars <- read_csv("seccion09/data/mtcars.csv")

mtcars$X1 <- NULL

mtc