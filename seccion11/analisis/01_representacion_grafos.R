#Representacion de grafos

library(Matrix)
library(tidyverse)

load("seccion11/data/meetup-hiking.Rdata")

View(users)

unique(users$user_id)
unique(users$group_id)

class(users$user_id)
class(users$group_id)


group_membership <- Matrix::sparseMatrix(users$group_id, users$id, x = TRUE)
