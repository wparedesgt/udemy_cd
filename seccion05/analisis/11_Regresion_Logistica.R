#Regresion Logistica

library(tidyverse)
library(caret)

bh <- read.csv("seccion05/data/boston-housing-logistic.csv")

bh$CLASS <- factor(bh$CLASS, levels = c(0,1))

set.seed(2018, sample.kind = "Rounding")

idx_bh <- createDataPartition(bh$CLASS, p = 0.7, list = FALSE)

mod <- glm(CLASS ~ ., data = bh[idx_bh,], family = binomial)

summary(mod)

bh[-idx_bh, "Prob_Success"] <- predict(mod, newdata = bh[-idx_bh,], type = "response")

bh

bh[-idx_bh, "Pred_50"] <- ifelse(bh[-idx_bh, "Prob_Success"] > 0.5, 1, 0)

bh

table(bh[-idx_bh,"CLASS"], bh[-idx_bh, "Pred_50"], dnn = c("Actual", "Predicho"))
