food <- read.delim2("~/Documents/Course/Multivariate Statistics/R scripts/BD/FoodPriceUSA.txt")
# Calculate Mean and STD
View(food)
print("The mean of the foods")
print(colMeans(food[, -1]))

print("The Standard Deviation of the foods")
sapply(food[, -1], sd)

print("Answer to question 2, we will use the correlation matrix since we will do a normalisation, because the variance of the data are very different.")