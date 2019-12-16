library(tidyverse)

housing <- read_csv("seccion03/data/BostonHousing.csv")

head(housing)

housing.z <- scale(housing, center = TRUE, scale = TRUE)
housing.mean <- scale(housing, center = TRUE, scale = FALSE)
housing.sd <- scale(housing, center = FALSE, scale = TRUE)

#Distribucion Normal

head(housing.z)


housing.none <- scale(housing, center = FALSE, scale = FALSE)

head(housing.none)
head(housing.mean)
head(housing.sd)

scale.many <- function(dataframe, cols){
  names <- names(dataframe)
  for (col in cols) {
    name <- paste(names[col], "z", sep = ".")
    dataframe[name] <- scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado", length(cols), " variabl(s)"))
  dataframe
}

scale.many(housing, c(1,3,5:8))
