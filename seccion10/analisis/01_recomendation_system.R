#Sistema de Recomendaciones

library(tidyverse)
library(recommenderlab)
library(caret)

data("MovieLense")

head(MovieLense)
dim(MovieLense)


rating_movies <- MovieLense[rowCounts(MovieLense)> 50, 
                            colCounts(MovieLense)> 100]


train_index <- sample(x = c(T,F), size = nrow(rating_movies),replace = TRUE, prob = c(0.8,0.2)) 

train_data <- rating_movies[train_index,]
test_data <- rating_movies[!train_index,]

rating_movies@data@Dim

rating_movies@data[1,]
rating_movies@data[,1]


head(rownames(rating_movies))
head(colnames(rating_movies))


#Filtrado colaboratico basado en los items(IBCF)

ibcf <- Recommender(data = train_data, 
                    method = "IBCF", 
                    parameter = list(k=30))

ibcf_mod <- getModel(ibcf)

ibcf_mod

n_rec <- 10

ibcf_pred <- predict(object = ibcf, 
                     newdata = test_data, 
                     n = n_rec)

ibcf_pred


ibcf_rec_matrix <- sapply(ibcf_pred@items, function(x){
  colnames(rating_movies)[x]
})

View(ibcf_rec_matrix[, 1:3])
