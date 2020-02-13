#Plots

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

head(cylinders)

#Histograma de frecuencias

hist(acceleration, 
     col = rainbow(12), 
     xlab = "Aceleracion", 
     ylab = "Frecuencias", 
     main = "Histograma de Aceleración", 
     breaks = 12)

hist(mpg, breaks = 16, prob = TRUE)
lines(density(mpg))


#Boxplot

boxplot(mpg, xlab = "Millas por Galon")

boxplot(mpg ~ model_year, xlab = "Millas por Galon (por año)")

boxplot(mpg ~ cylinders, xlab = "Consumo por No. de Cilindros")

boxplot(auto)


#Scatterplot

plot(mpg ~ horsepower, type = 'n')

linearmodel <- lm(mpg ~ horsepower)

abline(linearmodel, col = 'black')

#Agregar colores por cilindrada

with(subset(auto, cylinders == '8cil'), 
     points(horsepower, mpg, col = "red"))
with(subset(auto, cylinders == '6cil'), 
     points(horsepower, mpg, col = "yellow"))

with(subset(auto, cylinders == '5cil'), 
     points(horsepower, mpg, col = "green"))

with(subset(auto, cylinders == '4cil'), 
     points(horsepower, mpg, col = "blue"))

with(subset(auto, cylinders == '3cil'), 
     points(horsepower, mpg, col = "black"))


#matriz scaterplot

pairs(~mpg + displacement + horsepower + weight)

#Combinacion de Plots con par

old_par <- par()

old_par

par(mfrow = c(1,2))

with(auto, {
  plot(mpg ~ weight, main = "Peso Vrs Consumo") 
  plot(mpg ~ acceleration, main = "Aceleracion vrs Consumo")
}
)

#regresar todos los parametros a por defecto

par(old_par)

#Ver la ayuda de ?par()


