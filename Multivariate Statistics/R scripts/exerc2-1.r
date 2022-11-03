c <- matrix(c(1, 0, -1, 1, -2, 1), nrow = 2)
p <- 2
sigma <- matrix(c(1, p, p, p, 1, p, p, p, 1), nrow = 3)

print(c %*% sigma %*% t(c))
