x1 <- c(14, 3, 2)
x2 <- c(12, 1, 3)
x3 <- c(11, 0, 2)
x4 <- c(13, 2, 0)

data_x <- data.frame(x1, x2, x3, x4)
print(data_x)

a <- 2

B <- matrix(c(1, 1, 0, -1, 0, 0, 1, -1, 1), nrow = 3)
S <- matrix(c(25, -2, 4, -2, 4, 1, 4, 1, 9), nrow = 3)
B %*% S %*% t(B)
