food <- read.delim2("~/Documents/Course/Multivariate Statistics/R scripts/BD/FoodPriceUSA.txt")
# Calculate Mean and STD
# View(food)
print("The mean of the foods")
print(colMeans(food[, -1]))

print("The Standard Deviation of the foods")
sapply(food[, -1], sd)

print("Answer to question 2, we will use the correlation matrix since we will do a normalisation, because the variance of the data are very different. The var of the var is given by")
print(var(sapply(food[, -1], var)))

print("Normalize the data")
# Normalize the data
pca_food <- prcomp(food[, -1], scale = TRUE)
sum_food <- summary(pca_food)
print(sum_food)
print(sprintf("PC_1 = %s (product - mean(product))(sd(product))", pca_food[1]))
print(sprintf("PC_2 = %s (product - mean(product))(sd(product))", pca_food[2]))

print("Corrleation between our data and our original data")
print(round(cor(food[, -1], pca_food$x), 2))
# print(sprintf("PC_2 is equal to %s X_1 +  %s X_2", eigen(sc)$vectors[3], eigen(sc)$vectors[4]))
