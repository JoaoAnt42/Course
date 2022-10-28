# Ex. 3.4

mean_x1 <- c(-1, -1)
print(mean_x1)
mean_x2 <- c(2, 1)
print(mean_x2)

sc <- matrix(c(7.3, -1.1, -1.1, 4.8), nrow = 2)
print(sc)
print(solve(sc))

# Fisher's discriminant function

t(mean_x1 - mean_x2) %*% solve(sc)

# Second term in the condition that defines Fisher's rule:

t(mean_x1 - mean_x2) %*% solve(sc) %*% (mean_x1 + mean_x2) / 2
