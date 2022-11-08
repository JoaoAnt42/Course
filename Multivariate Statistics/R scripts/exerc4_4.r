library(readxl)
path_data <- "~/Documents/Course/Multivariate Statistics/R scripts/BD/SimpleData.xls"
simple <- read_excel(path_data)
# View(simple)

sc <- var(simple)

print(eigen(sc))
print(sprintf("PC_1 is equal to %s X_1 + %s X_2", eigen(sc)$vectors[1], eigen(sc)$vectors[2]))
print(sprintf("PC_2 is equal to %s X_1 +  %s X_2", eigen(sc)$vectors[3], eigen(sc)$vectors[4]))

# 2
total_var <- sum(eigen(sc)$values)
print("total variance of PC1 and PC2 is given by")
print(total_var)

print("The sum of the variances of simple")
print(sum(sapply(simple, sd)))
