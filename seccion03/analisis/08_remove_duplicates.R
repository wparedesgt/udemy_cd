library(tidyverse)

family_salary <- c(40000, 60000, 50000, 80000, 60000, 70000, 60000)
family_size <- c(4,3,2,2,3,4,3)
family_car <- c("Lujo", "Compacto", "Utilitario", "Lujo", "Compacto", "Compacto", "Compacto")
family <- tibble(family_salary, family_size, family_car)


unique(family)

family_unique <- unique(family)

duplicated(family)

family[duplicated(family),]
