#Regresion Lineal

library(tidyverse)
library(caret)

auto <- read_csv("seccion06/data/auto-mpg.csv")

head(auto)

auto$cylinders <- factor(auto$cylinders, 
                         levels = c(3,4,5,6,8),
                         labels = c("3c","4c","5c","6c","8c"))

set.seed(2018, sample.kind = "Rounding")


index_auto <- createDataPartition(auto$mpg, p = 0.7, list = FALSE)

names(auto)

mod <- lm(mpg ~., data = auto[index_auto, -c(1,8,9)])

mod

#mpg = 38.607312 + 7.212652 *4c + 5.610350 + 3.307172 + 6.211343 * 8c

# + 0.006878 * displacemente - 0.07209 * horsepower
# + -0.005156 * weight + 0.024852 * acceleration

summary(mod)

boxplot(mod$residuals)

#Error cuadratico medio

sqrt(mean((mod$fitted.values - auto[index_auto,]$mpg)^2))


pred <- predict(mod, auto[-index_auto, -c(1,8,9)])

sqrt(mean((pred- auto[-index_auto,]$mpg)^2))


par(mfrow = c(2,2))

plot(mod)

