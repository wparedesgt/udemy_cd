#plyr XYply = a <- array, d<- dataframe, l <- list,  _<- no output

library(tidyverse)
library(plyr)

auto <- read_csv("seccion12/data/auto-mpg.csv")

auto$cylinders <- factor(auto$cylinders, 
                         levels = c(3,4,5,6,8), 
                         labels = c("3C", "4C", "5C", "6C", "8C"))


ddply(auto, "cylinders", function(df) { mean(df$mpg)})
ddply(auto, ~cylinders, function(df){mean(df$mpg)})

ddply(auto, c("cylinders", "model_year"), 
      function(df){
        c(mean = mean(df$mpg), 
          min = min(df$mpg), 
          max = max(df$mpg))
      })


ddply(auto, .(cylinders), summarize, freq = length(cylinders), meanmpg = mean(mpg))

par(mfrow = c(3,2))

d_ply(auto, "cylinders", summarise, 
      hist(mpg, xlab = "Millas por Galon", 
           main = "Histograma de Frecuencia", breaks = 5))


autos <- list(auto, auto)
auto.big <- ldply(autos, I)


mat <- matrix(seq(1,9), 3, 3)

apply(mat, 1, sum)

x <- list(a = 1, b = 1:5, x = 10:50)

lapply(x, FUN = length)

sapply(x, FUN = length)


mapply()