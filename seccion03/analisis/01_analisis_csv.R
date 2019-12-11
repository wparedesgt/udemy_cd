library(tidyverse)
library(MASS)

auto_mpg <- read_csv("seccion03/data/auto-mpg.csv")
head(auto_mpg)
names(auto_mpg)

auto_mpg_noheader <- read_csv("seccion03/data/auto-mpg-noheader.csv",col_names = FALSE)

head(auto_mpg_noheader)

#Asigno los nombres

colnames(auto_mpg_noheader) <- c(names(auto_mpg))

auto_mpg_noheader %>% head()

