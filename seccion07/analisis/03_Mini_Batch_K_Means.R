#

library(tidyverse)
library(OpenImageR)
library(ClusterR)


img <- readImage("seccion07/data/bird.jpg")

img_resize <- resizeImage(img, 350,350, 
                          method = "bilinear")

imageShow(img_resize)

img_vector <- apply(img_resize, 3, as.vector)

dim(img_vector)

kmmb <- MiniBatchKmeans(img_vector, clusters = 6, 
                        batch_size = 20, num_init = 5, 
                        max_iters = 100, init_fraction = 0.2, 
                        initializer = "kmeans++", 
                        early_stop_iter = 10, 
                        verbose = FALSE)

kmmb


prmb <- predict_KMeans(img_vector, kmmb$centroids )

get_cent_mb <- kmmb$centroids

new_image <- get_cent_mb[prmb,]

dim(new_image) <- c(nrow(img_resize), ncol(img_resize),3)

imageShow(new_image)
