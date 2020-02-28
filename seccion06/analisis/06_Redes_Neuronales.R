#Redes Neuronales

library(tidyverse)
library(caret)
library(devtools)

bh <- read.csv("seccion06/data/BostonHousing.csv")

set.seed(2018, sample.kind = "Rounding")

index_bh <- createDataPartition(bh$MEDV, p = 0.7, list = FALSE)

summary(bh$MEDV)

fitbh <- nnet::nnet(MEDV/50 ~., data = bh[index_bh,],
                    size = 6, decay = 0.1, 
                    maxit = 1000, linout = TRUE)

source_url("https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r")

plot(fitbh, max.sp = TRUE)


sqrt(mean((fitbh$fitted.values*50 - bh[index_bh, "MEDV"])^2))


pred <- predict(fitbh, bh[-index_bh,])

sqrt(mean((pred*50 - bh[-index_bh, "MEDV"])^2))
