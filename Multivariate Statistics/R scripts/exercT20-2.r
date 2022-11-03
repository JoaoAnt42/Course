x1 <- c(5, 6, 5, 7, 3, 6)
x2 <- c(9, 12, 11, 13, 9, 10)
x3 <- c(18, 20, 21, 20, 17, 21)

p <- 3
dat <- data.frame(x1, x2, x3)
covMat <- cov(dat)
print(covMat)
mean_X <- colMeans(dat)

n <- 6
obtain_lims <- function(a, type_interval = "Roy") {
    # Roy Interval for mu_1:
    m <- 4
    alpha <- 0.05
    if (type_interval == "Roy") {
        # Convertion of a to row by using a transpose of the transpose this is the same as doing just a ... -.-
        zzz <- sqrt((n - 1) * p / (n - p) * qf(1 - alpha, p, n - p) * a %*% covMat %*% t(t(a)) / n)
    } else {
        # T-student quantile
        zzz <- sqrt(qt(1 - alpha / (2 * m), n - 1)^2 * a %*% covMat %*% t(t(a)) / n)
    }

    lowerlim_1 <- t(a) %*% mean_X - zzz
    upperlim_1 <- t(a) %*% mean_X + zzz
    print(c(lowerlim_1, upperlim_1))
}
obtain_lims(a = c(1, 0, 0), type_interval = "Bonferroni")
obtain_lims(a = c(-1, 1, 0), type_interval = "Bonferroni")
obtain_lims(a = c(0, -1, 1), type_interval = "Bonferroni")

obtain_lims(a = c(4, -2, 0), type_interval = "Bonferroni")
obtain_lims(a = c(0, 2, -1), type_interval = "Bonferroni")
