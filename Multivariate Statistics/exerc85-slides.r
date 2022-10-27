x1 <- c(3, 5, 5, 7, 7, 7, 8, 9, 10, 11)
x2 <- c(2.3, 1.9, 1, 0.7, 0.3, 1, 1.05, 0.45, 0.7, 0.3)
p <- 2
dat <- data.frame(x1, x2)
mean.dat <- colMeans(dat)
# When we are in teorical point view should be written, when we have samples we can obtain using cov, like here
cov.dat <- cov(dat)

print(mahalanobis(dat, mean.dat, cov.dat))

print("50% Quantile")
quant_50 <- qchisq(0.5, p)
print(quant_50)
print(qchisq(0.5, p))

print("Coun the number of observations below the 50% quantile")
print(sum(mahalanobis(dat, mean.dat, cov.dat) < quant_50))

print("25% Quantile")
quant_25 <- qchisq(0.25, p)
print(quant_25)

print("Coun the number of observations below the 25% quantile")
print(sum(mahalanobis(dat, mean.dat, cov.dat) < quant_25))
