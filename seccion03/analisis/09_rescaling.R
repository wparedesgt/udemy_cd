library(tidyverse)
library(scales)


students <- read.csv("seccion03/data/data-conversion.csv")
students$Income_rescale <- rescale(students$Income)

#Formula rescalar

(students$Income - min(students$Income)) / 
  (max(students$Income) - min(students$Income))

#rescalando a 100

rescale(students$Income, to = c(0,100))

rescale.many <- function(dataframe, cols) {
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "rescaled", sep = ".")
    dataframe[name] <- rescale(dataframe[,col])
  }
  
  cat(paste("Hemos reescalado", length(cols), " Variable(s)"))
  dataframe
}

students <- rescale.many(students, c(1,4))

students
