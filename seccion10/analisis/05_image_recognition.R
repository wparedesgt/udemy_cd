#Reconocimiento de Imagenes

library(tidyverse)
library(mxnet)


install.packages("jpeg")
install.packages("png")

install.packages("drat")

library(devtools)

devtools::install_github("rich-iannone/DiagrammeR")


#source("http://bioconductor.org/biocLite.R")

#biocLite()

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()


BiocManager::install(c("GenomicFeatures", "AnnotationDbi"))

BiocManager::install("EBImage")

library(mxnet)
