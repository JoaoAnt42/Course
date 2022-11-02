x1 <- c(3, 4, 1, 2, 3, 1, 3, 2)
x2 <- c(5, 5, 2, 3, 3, 3, 5, 3)
p <- 2
dat <- data.frame(x1, x2)
mean.dat <- colMeans(dat)
# When we are in teorical point view should be written, when we have samples we can obtain using cov, like here
cov.dat <- cov(dat)

print(mahalanobis(dat, mean.dat, cov.dat))


print("75% Quantile")
quant_75 <- qchisq(0.75, p)
print(quant_75)

print("Coun the number of observations below the 75% quantile")
print(sum(mahalanobis(dat, mean.dat, cov.dat) < quant_75))

covMat <- matrix(c(1.13, 1.02, 1.02, 1.41), nrow = 2)
mean_x <- c(2.38, 3.63)
obtain_lims <- function(a, type_interval = "Roy") {
    # Roy Interval for mu_1:
    n <- 8
    p <- 2
    m <- 4
    alpha <- 0.01
    if (type_interval == "Roy") {
        # Convertion of a to row by using a transpose of the transpose this is the same as doing just a ... -.-
        zzz <- sqrt((n - 1) * p / (n - p) * qf(1 - alpha, p, n - p) * a %*% covMat %*% t(t(a)) / n)
    } else {
        # T-student quantile
        zzz <- sqrt(qt(1 - alpha / (2 * m), n - 1)^2 * a %*% covMat %*% t(t(a)) / n)
    }

    lowerlim_1 <- t(a) %*% mean_x - zzz
    upperlim_1 <- t(a) %*% mean_x + zzz
    print(c(upperlim_1, lowerlim_1))
}
obtain_lims(a = c(1, 0), type_interval = "Bonferroni")
obtain_lims(a = c(0, 1), type_interval = "Bonferroni")

obtain_lims(a = c(1, 0), type_interval = "Roy")
obtain_lims(a = c(0, 1), type_interval = "Roy")
