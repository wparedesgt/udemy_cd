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




