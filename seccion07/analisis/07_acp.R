#Analisis Componentes Principales 

library(tidyverse)
library(corrplot)


bh <- read_csv("seccion07/data/BostonHousing.csv")

corr <- cor(bh[, -14])

corr

corrplot(corr, method = "color")

corrplot(corr, method = "circle")
#scale = TRUE matriz de correlaciones
#scale = FALSE matriz de covarianzas

bh_acp <- prcomp(bh[,-14], scale = TRUE)

summary(bh_acp)


plot(bh_acp)

plot(bh_acp, type = "lines")

biplot(bh_acp, col = c("gray", "red"))

head(bh_acp$x)


bh_acp$rotation

bh_acp$sdev
