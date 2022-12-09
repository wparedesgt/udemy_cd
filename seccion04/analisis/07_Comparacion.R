library(tidyverse)
library(lattice)
library(beanplot)

datos <- read.csv("seccion04/data/daily-bike-rentals.csv", stringsAsFactors = FALSE)

str(datos)
summary(datos)
names(datos)

datos$season <- factor(datos$season, levels = c(1,2,3,4),
                       labels = c("Invierno", "Primavera", "Verano", "Otoño"))

datos$workingday <- factor(datos$workingday, levels = c(0,1), 
                           labels = c("Festivo", "De Trabajo"))

datos$weathersit <- factor(datos$weathersit, levels = c(1,2,3),
                           labels = c("Despejado", "Nublado", "Lluvia Ligera"))

datos$dteday <- as.Date(datos$dteday, format = "%Y-%m-%d")

attach(datos)

par(mfrow = c(2,2))

winter <- subset(datos, season == "Invierno")$cnt
spring <- subset(datos, season == "Primavera")$cnt
summer <- subset(datos, season == "Verano")$cnt
fall <- subset(datos, season == "Otoño")$cnt


hist(winter, prob = TRUE, xlab = "Alquilier diario invierno", main = "")
lines(density(winter))
abline(v = mean(winter), col = "red")
abline(v = median(winter), col = "blue")

hist(spring, prob = TRUE, xlab = "Alquilier diario primavera", main = "")
lines(density(spring))
abline(v = mean(spring), col = "red")
abline(v = median(spring), col = "blue")

hist(summer, prob = TRUE, xlab = "Alquilier diario verano", main = "")
lines(density(summer))
abline(v = mean(summer), col = "red")
abline(v = median(summer), col = "blue")

hist(fall, prob = TRUE, xlab = "Alquilier diario otoño", main = "")
lines(density(fall))
abline(v = mean(fall), col = "red")
abline(v = median(fall), col = "blue")


##beanplot

par(mfrow = c(1,1))

beanplot(datos$cnt ~ datos$season, col = c("blue", "red", "yellow"))


#Causalidad

lattice::bwplot(cnt~weathersit, data = datos, 
                layout = c(1,1), 
                xlab = "Pronostico del Tiempo", 
                ylab = "Frecuencias",
                panel = function(x,y,...){
                  panel.bwplot(x,y,...)
                  panel.stripplot(x,y,jitter.data = TRUE, ...)
                },
                par.settings = list(box.rectangle = list(fill = c('red', 'yellow', 'green'))))

