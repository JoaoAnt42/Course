sample <- matrix(c(3, 6, 4, 4, 5, 7, 4, 7), nrow = 4)
print(sample)
print("The Mean is given by")
mean.dat <- colMeans(sample)
print(mean.dat)

print("The cov is given by")
cov.dat <- cov(sample)
print(cov.dat)
