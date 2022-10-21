meanX <- c(527.74, 54.69, 25.13)
covMat <- matrix(c(5691.34, 600.51, 217.25, 600.51, 126.05, 23.34, 217.25, 23.34, 23.11), nrow = 3)

obtain_lims <- function(a, type_interval = "Roy") {
    # Roy Interval for mu_1:
    n <- 87
    p <- 3
    m <- 4
    alpha <- 0.05
    if (type_interval == "Roy") {
        # Convertion of a to row by using a transpose of the transpose this is the same as doing just a ... -.-
        zzz <- sqrt((n - 1) * p / (n - p) * qf(1 - alpha, p, n - p) * a %*% covMat %*% t(t(a)) / n)
    } else {
        # T-student quantile
        zzz <- sqrt(qt(1 - alpha / (2 * m), n - 1)^2 * a %*% covMat %*% t(t(a)) / n)
    }

    lowerlim_1 <- t(a) %*% meanX - zzz
    upperlim_1 <- t(a) %*% meanX + zzz
    print(c(upperlim_1, lowerlim_1))
}
print("Obtain the Roy Intervals for mu_1, mu_2, mu_3 and 1/3(mu_1, mu_2, mu_3)")
obtain_lims(a = c(1, 0, 0))
obtain_lims(a = c(0, 1, 0))
obtain_lims(a = c(0, 0, 1))
obtain_lims(a = c(1 / 3, 1 / 3, 1 / 3))
print("Obtain the Bonferroni Intervals for mu_1, mu_2, mu_3 and 1/3(mu_1, mu_2, mu_3)")
obtain_lims(a = c(1, 0, 0), type_interval = "Bonferroni")
obtain_lims(a = c(0, 1, 0), type_interval = "Bonferroni")
obtain_lims(a = c(0, 0, 1), type_interval = "Bonferroni")
obtain_lims(a = c(1 / 3, 1 / 3, 1 / 3), type_interval = "Bonferroni")
