install.packages("matlib")

x1 <- c(30, 90, -10, 10, 30, 60, 0, 40)
x2 <- c(-8, 7, -2, 0, -2, 0, -2, 1)
x3 <- c(-1, 6, 4, 2, 5, 3, 4, 2)

p <- 3

# When we are in teorical point view should be written, when we have samples we can obtain using cov, like here
dat <- data.frame(x1, x2, x3)
print("The Mean is given by")
mean.dat <- colMeans(dat)
print(mean.dat)

print("The cov is given by")
cov.dat <- cov(dat)
print(cov.dat)

print("Mahalanobis distance for the 8 pacients")
print(mahalanobis(dat, mean.dat, cov.dat))

print("50% Quantile")
quant_50 <- qchisq(0.5, p)
print(quant_50)

print("Coun the number of observations below the 50% quantile")
print(sum(mahalanobis(dat, mean.dat, cov.dat) < quant_50))

print("25% Quantile")
quant_25 <- qchisq(0.25, p)
print(quant_25)

print("Coun the number of observations below the 25% quantile")
print(sum(mahalanobis(dat, mean.dat, cov.dat) < quant_25))

print("75% Quantile")
quant_75 <- qchisq(0.75, p)
print(quant_75)

print("Coun the number of observations below the 75% quantile")
print(sum(mahalanobis(dat, mean.dat, cov.dat) < quant_75))

