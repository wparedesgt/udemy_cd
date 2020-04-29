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


#Filtrado colaborativo basado en Usuarios (UBCF)

ubcf <- Recommender(data = train_data, method = "UBCF")

ubcf_model <- getModel(ubcf)

ubcf_model


ubcf_pred <- predict(object = ubcf, 
                     newdata = test_data, 
                     n = n_rec)


ubcf_pred

ubcf_rec_matrix <- sapply(ubcf_pred@items, 
                          function(x){
                            colnames(rating_movies[x])
                          })

View(ubcf_rec_matrix[,1:3])


#Representacion de la matriz de recomendaciones

recommender_models <- recommenderRegistry$get_entries(dataType = "realRatingMatrix")

names(recommender_models)


image(MovieLense, main = "Mapa de Calor Matriz de Valoraciones")


min_n_movies <- quantile(rowCounts(MovieLense), 0.99)
min_n_users <- quantile(colCounts(MovieLense), 0.99)

min_n_movies
min_n_users


image(MovieLense[rowCounts(MovieLense)> min_n_movies, 
                 colCounts(MovieLense) > min_n_users])


min_r_movies <- quantile(rowCounts(rating_movies), 0.98)
min_r_users <- quantile(colCounts(rating_movies), 0.98)

image(rating_movies[rowCounts(rating_movies) > min_r_movies, 
                    colCounts(rating_movies) > min_r_users], 
      main = "Mapa de Calor top de peliculas y usuarios")



#Recomendaciones basadas en datos binarios

rating_movies_viewed <- binarize(rating_movies, minRating = 1)
image(rating_movies_viewed)

rating_index <- sample(x = c(T,F), 
                       size = nrow(rating_movies_viewed), 
                       replace = TRUE, 
                       prob = c(0.8,0.2))

b_data_train <- rating_movies_viewed[rating_index,]
b_data_test <- rating_movies_viewed[!rating_index,]

#Jaccard Index : d(i,j) -(i y j) / (i o j)

b_model <- Recommender(data = b_data_train, 
                       method = "IBCF", 
                       parameter = list(method = "jaccard"))

b_details <- getModel(b_model)
b_details


b_pred <- predict(object = b_model, 
                  newdata = b_data_test, 
                  n = n_rec)

b_rec_matrix <- sapply(b_pred@items, function(x){
  colnames(rating_movies)[x]
})

View(b_rec_matrix[,1:3])
