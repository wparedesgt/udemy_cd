library(tidyverse)

clientes <- c("Juan Gabriel", "Ricardo", "Pedro")
fechas <- as.Date(c("2017-12-27", "2017-11-1", "2018-1-1"))
pago <- c(315,192.55, 40.15)

pedidos <- tibble(clientes, fechas, pago)

clientes_vip <- c("Juan Gabriel", "Ricardo")

save(pedidos, clientes_vip, file = "seccion03/data/pedidos.Rdata")

saveRDS(pedidos, file ="seccion03/data/pedidos.rds")

remove(pedidos)

load("seccion03/data/pedidos.Rdata")

orders <- readRDS("seccion03/data/pedidos.rds")

remove(cars)
remove(iris)

#Guarda toda la secion

save.image(file ="seccion03/data/alldata.Rdata" )

primes <- c(2,3,5,7,11,13)
pow2 <- c(2,4,6,16,32,64,128)

save(list = c("primes", "pow2"), file = "seccion03/data/primes_and_pow2.Rdata")


