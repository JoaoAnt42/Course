x1 <- matrix(c(5, 6, 5, 7, 3, 6, 9, 12, 11, 13, 9, 10, 18, 20, 21, 20, 17, 21), nrow = 6)

p <- 3
# dat <- data.frame(x1, x2, x3)
covMat <- cov(x1)
print(covMat)
# mean_X <- colMeans(dat)
