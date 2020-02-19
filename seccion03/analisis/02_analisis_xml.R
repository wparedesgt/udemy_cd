library(tidyverse)
library(XML)

#Leer un xml


url <- "seccion03/data/cd_catalog.xml"
xmldoc <- xmlParse(url)  
rootnode <- xmlRoot(xmldoc)
cd_data <- xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))

#Transponiendo los datos y convirtiendolo en un dataframe

t(cd_data)

cds_catalog <- data.frame(t(cd_data), row.names = NULL) 

cds_catalog %>% head()

cds_catalog[1:5,]

population_url <- "seccion03/data/WorldPopulation-wiki.htm"

tables <- readHTMLTable(population_url)

most_populated <- tables[[6]]

most_populated %>% head()

custom_table <- readHTMLTable(population_url, wich = 6)

custom_table %>% head()
