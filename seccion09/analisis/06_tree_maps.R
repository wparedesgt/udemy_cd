#Tree Maps

library(tidyverse)
library(treemap)


branch <- c(rep("branch-1", 4), rep("branch-2", 2), rep("branch-3", 3))
subbranch <- paste("subbranch", c(1:4, 1:2, 1:3))
values <- c(15,4,22,13,11,8,6,1,25)
datos <- data.frame(branch, subbranch, values)


treemap(datos, index = c("branch", "subbranch"), 
        vSize = "values", type = "index")

post <- read_csv("seccion09/data/post-data.csv")
head(post)


treemap(post, index = c("category", "comments"), 
        vSize = "views", type = "index")
