library(tidyverse)

students <- read_csv("seccion03/data/data-conversion.csv")
head(students)

bp <- c(-Inf, 10000, 31000, Inf)
names <- c("Low", "Average", "High")

students$Income_cat <- cut(students$Income, breaks = bp, labels = names)

students$Income_cat2 <- cut(students$Income, breaks = bp)

students

str(students)
