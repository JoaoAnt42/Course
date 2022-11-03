sig <- matrix(c(1, -2, 0, -2, 5, 0, 0, 0, 2), nrow = 3)
print(sig)


print(eigen(sig))
print("PC_1 is equal to -0.38 X_1 + 0.92 X_2")
print("PC_2 is equal to X_3")
print("PC_3 is equal to 0.924 X_1 +  0.383 X_2")

# 2
total_var <- sum(eigen(sig)$values)
print("total variance is given by ")
print(total_var)

print("Proportion given by the first component:")
proc_pc1 <- eigen(sig)$values[1] / total_var
print(proc_pc1)

print("Proportion given by the 2nd component:")
proc_pc2 <- eigen(sig)$values[2] / total_var
print(proc_pc2)

# 3
# Cor(pc1, x1) = a11 * sqrt(var(pc1) / var(x1))
print(eigen(sig)$vectors[1] * sqrt(eigen(sig)$values[1]) / sqrt(1))

print(eigen(sig)$vectors[2] * sqrt(eigen(sig)$values[1]) / sqrt(5))

print(eigen(sig)$vectors[3] * sqrt(eigen(sig)$values[1]) / sqrt(2))

print("The importance of X1 and X2 is very similar, the X2 has a higher a21 but also has a higher variance")
print("In this case the sign doesn't do anything")

print("Yes, tghe variable X1 and X2 have equal importance for the construction of the PC1 since the loadings are similar")
