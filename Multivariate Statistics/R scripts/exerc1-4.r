str(iris)
cov_iris <- cov(iris[1:4])
mean_iris <- colMeans(iris[1:4])
cor_iris <- cor(iris[1:4])

y2 <- matrix(c(1, 0, 1, 0))
print(y2)
print(cov_iris)
print(dim(y2))
print(dim(iris[1:4]))
print(dim(cov_iris))
y3 <- iris[1:4] %*% t(y2)
print(cov(y3))