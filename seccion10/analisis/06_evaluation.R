#Evaluacion de modelos y parametros

library(tidyverse)
library(recommenderlab)

data("MovieLense")

rating_movies <- MovieLense[rowCounts(MovieLense) > 50, 
                            colCounts(MovieLense) > 100]

n_folds <- 4
items_to_keep <- 15
rating_threshold <- 3
eval_sets <- evaluationScheme(data = rating_movies, 
                              method = "cross-validation", 
                              k = n_folds, 
                              given = items_to_keep, 
                              goodRating = rating_threshold)

size_sets <- sapply(eval_sets@runsTrain, length)

size_sets


#Evaluacion de los Ratings

model_type <- "IBCF"
model_params <- NULL

eval_recommender <- Recommender(data = getData(eval_sets, "train"), 
                                method = model_type, 
                                parameter = model_params)

items_to_recommend <- 10

eval_prediction <- predict(object = eval_recommender, 
                           newdata = getData(eval_sets, "know"), 
                           n = items_to_recommend, 
                           type = "ratings")

class(eval_prediction)


qplot(rowCounts(eval_prediction)) + geom_histogram(bindwidth = 20) +
  ggtitle("Distribucion de peliculas por usuario")


eval_accuracy <- calcPredictionAccuracy(x = eval_prediction, 
                                        data = getData(eval_sets, "unknown"), 
                                                       byUser = TRUE)

head(eval_accuracy)


qplot(eval_accuracy[,1])

#Evaluacion de las recomendaciones

results <- evaluate(x = eval_sets, 
                    method = model_type, 
                    n = seq(10,100,10))

getConfusionMatrix(results)

plot(results, "prec/rec", annotate = TRUE, main = "Precision Vrs Eficacia")

#Comparar Modelos

#Ejercicio usar la distancia euclidea

models <- list(IBCF_cos = list(name = "IBCF", params = list(method = "cosine")), 
               IBCF_cor = list(name = "IBCF", params = list(method = "pearson")), 
               UBCF_cos = list(name = "UBCF", params = list(method = "cosine")), 
               UBCF_cor = list(name = "UBCF", params = list(method = "pearson")), 
               random = list(name = "RANDOM", params = NULL))

n_recomends <- c(1:5, seq(10,100,10))

results <- evaluate(x = eval_sets, 
                    method = models, 
                    n = n_recomends)

results

plot(results, annotate = 1, legend = "topleft") + title("curva AUC")

plot(results, "prec/rec", annotate = 1, legend = "topright") + title("Precision Vrs Eficacia")


#Ajustar parámetros

vector_k <- c(5, seq(10,40,10))
models <- lapply(vector_k, function(k){
  list(name = "IBCF", param = list(method = "pearson", k = k))
})

models

names(models) <- paste0("IBCF_k_", vector_k)

models

results <- evaluate(x= eval_sets, 
                    method = models, 
                    n = n_recomends)

plot(results, annotate = 1, legend = "topleft") + title("Curva ROC")
plot(results, "prec/rec", annotate = 1, legend = "bottomright") + title("Precision Vrs Eficacia")
