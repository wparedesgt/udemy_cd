library(tidyverse)

students <- read_csv("seccion03/data/data-conversion.csv")
head(students)

bp <- c(-Inf, 10000, 31000, Inf)
names <- c("Low", "Average", "High")

students$Income_cat <- cut(students$Income, breaks = bp, labels = names)

students$Income_cat2 <- cut(students$Income, breaks = bp)

students$Income_cat3 <- cut(students$Income, breaks = 4, 
                            labels = c("Level 1", "Level 2", 
                                       "Level 3", "Level 4"))

students

str(students)

#dumy variables

students <- read.csv("seccion03/data/data-conversion.csv")

library(dummies)

students_dummy <- dummy.data.frame(students, sep = "_")

dummy(students$State, sep = "_")

dummy.data.frame(students, names = c("State", "Gender"), sep = "_")

