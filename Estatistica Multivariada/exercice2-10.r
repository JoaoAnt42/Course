x <- matrix(c(0, 1, 2, 0, 4, 2), nrow = 3)

xbar <- colMeans(x)
print(xbar)

var_x <- var(x)
print(var_x)

# For example if we want to calculate the P(4F_{2,2})<15
?pf
q_x <- 1.5 / 4
fred_1 <- 2
fred_2 <- 2
pf(q_x, fred_1, fred_2, lower.tail = TRUE)


a <- 1
