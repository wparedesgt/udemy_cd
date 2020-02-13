#Quantil quantil

library(tidyverse)

s <- seq(0.01,0.99,0.01)

qn <- qnorm(s)

qn

df <- data.frame(p = s, q = qn)

df

sample <- rnorm(200)

sample

quantile(sample, probs = s)

#qqnorm

trees

qqnorm(trees$Height)


#qqplot

randu

n <- length(randu$x)

n

y <- qunif(ppoints(n))

qqplot(y, randu$x)


chi3 <- qchisq(ppoints(30), df = 3)

n30 <- qnorm(ppoints(30))

qqplot(n30, chi3)


qqplot(chi3, chi3)


#Distribucion cauchi

cauchy <- qcauchy(ppoints(30))

qqplot(n30, cauchy)


x <- seq(-3, 3, 0.01)

plot(x, dnorm(x))

plot(x, pnorm(x))

plot(x, dchisq(x, df = 3))

plot(x, pchisq(x, df = 3))

plot(x, dcauchy(x))

plot(x, pcauchy(x))
