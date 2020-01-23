library(tidyverse)
library(mice)

ozone_data <- read_csv("seccion03/data/ozone.csv")
                  

head(ozone_data)
names(ozone_data)

boxplot(ozone_data$pressure_height, 
        main = "Presure Height", 
        boxwex = 0.5)
summary(ozone_data$pressure_height)



ozone_data <- read.csv("seccion03/data/ozone.csv", stringsAsFactors = FALSE)

boxplot(pressure_height ~ Month, 
        data = ozone_data, 
        main = "Pressure Heigth per Month")

boxplot(ozone_reading ~ Month, 
        data = ozone_data, 
        main = "Ozone reading per Month")

#con $out se obtienen los outliers en el boxplot

mtext(boxplot(ozone_reading ~ Month, 
              data = ozone_data, 
              main = "Ozone reading per Month")$out)

impute_outliers <- function(x, removeNa = TRUE) {
  quantiles <- quantile(x, c(0.05, 0.95), na.rm = removeNa)
  x[x<quantiles[1]] <- mean(x, na.rm = removeNa)
  x[x>quantiles[2]] <- median(x, na.rm = removeNa)
  x
}

imputed_data <- impute_outliers(ozone_data$pressure_height)

par(mfrow = c(1,2))

boxplot(ozone_data$pressure_height, main = "Presion con outliers")
boxplot(imputed_data, main = "Presion sin outliers")

replace_outliers <- function(x, removeNa = TRUE){
  qrts <- quantile(x, probs = c(0.25, 0.75), na.rm = removeNa)
  caps <- quantile(x, probs = c(0.05, 0.95), na.rm = removeNa)
  iqr <- qrts[2] - qrts[1]
  h <- 1.5 * iqr
  x[x<qrts[1]-h] <- caps[1]
  x[x>qrts[2]+h] <- caps[2]
  x
}

capped_pressure_height <- replace_outliers(ozone_data$pressure_height)

par(mfrow = c(1,2))

boxplot(ozone_data$pressure_height, main = "Presion con outliers")
boxplot(capped_pressure_height, main = "Presion sin outliers")
