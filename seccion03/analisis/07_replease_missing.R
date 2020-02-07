library(tidyverse)

data <- read_csv("seccion03/data/missing-data.csv", na = "")


data$Income_mean <- ifelse(is.na(data$Income), 
                           mean(data$Income, na.rm = TRUE), 
                           data$Income)


data$Income_0 <- ifelse(is.na(data$Income), 0, data$Income)


#x es un vector de datos que puede contener NA
rand.impute <- function(x) {
  # missing contiene un vector de valores T/F dependiendo del NA de x
  missing <- is.na(x)
  #n.missing contiene cuantos valores son NA dentro de x
  n.missing <- sum(missing)
  #x.obs son los valores conocidos que tienen dato diferente de NA en x
  x.obs <- x[!missing]
  #por defecto, devolveré lo mismo que había entrado por parámetro
  imputed <- x
  #en los valores que faltaban, los reemplazamos por una muestra
  #de los que si conocemos (MAS)
  imputed[missing] <- sample(x.obs, n.missing, replace = TRUE)
  return (imputed)
}


random.impute.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "imputed", sep = ".")
    dataframe[name] = rand.impute(dataframe[,col])
  }
  dataframe
}

data <- read.csv("seccion03/data/missing-data.csv", na.strings = "")

#data <- read_csv("seccion03/data/missing-data.csv", na = "")
data$Income[data$Income==0]<-NA
data <- random.impute.data.frame(data, c(1,2))

data %>% head()
