#funcion apply

m <- matrix(seq(1:16), 4, 4)

#1 funcion aplicada por filas
#2 funcion aplicada a columnas
#c(1,2) funcion aplicada a alementos


apply(m, 1, min)
apply(m, 2, min)
apply(m, 1,prod)
apply(m, 2, sum)
apply(m, c(1,2),function(x){x^2})
apply(m, 1, quantile, probs = c(0.4,0.6,0.8))

colSums(m)
rowSums(m)

colMeans(m)
rowMeans(m)

array3D  <- array(seq(1,32), dim = c(4,4,2))


apply(array3D, 3, sum)
apply(array3D, 3, mean)
apply(array3D, c(1,2), sum)
