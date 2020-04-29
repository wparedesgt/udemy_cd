#Correlation Matrix

library(tidyverse)
library(corrplot)
library(reshape2)


mtcars <- read_csv("seccion09/data/mtcars.csv")

mtcars$X1 <- NULL

mtcars_cor <- cor(mtcars, method = "pearson")

round(mtcars_cor, digits = 2)

corrplot(mtcars_cor)

corrplot(mtcars_cor, method = "shade", 
         shade.col = NA, 
         tl.col = "black", 
         tl.srt = 45)

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", 
                          "#77AADD", "#4477AA"))


corrplot(mtcars_cor, method = "shade",sade.col = NA, tl.col = "black", 
         tl.srt = 45, col = col(200), 
         addCoef.col = "black", addcolorlabel = "no", 
         order ="AOE",
         type = "upper", 
         diag = FALSE, 
         addshade = "all")


corrplot(mtcars_cor, method = "shade",shade.col = NA, tl.col = "black", 
         tl.srt = 45, col = col(200), 
         addCoef.col = "black", addcolorlabel = "no", 
         order ="AOE",
         type = "upper", 
         diag = FALSE, 
         addshade = "all")


mtcars_melted <- melt(mtcars_cor)

head(mtcars_melted)

mtcars_melted %>% ggplot(aes(Var1, Var2, fill = value)) + geom_tile()


get_lower_triangle <- function(cormat) {
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}


get_upper_triangle <- function(cormat) {
  cormat[lower.tri(cormat)] <- NA
  return(cormat)
}

reorder_cormat <- function(cormat){
  dd <- as.dist((1-cormat)/2)
  hc <-  hclust(dd)
  cormat <- cormat[hc$order, hc$order]
}

cormat <- reorder_cormat(mtcars_cor)
cormat_ut <- get_upper_triangle(cormat)
cormat_ut_melted <- melt(cormat_ut, na.rm = TRUE)

cormat_ut_melted %>% ggplot(aes(Var2, Var1, fill = value)) + 
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name = "Pearson/Correlation") + theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1)) +
  coord_fixed()

