sig <- matrix(c(1, -2, 0, -2, 5, 0, 0, 0, 2), nrow = 3)
print(sig)


print(eigen(sig))
print("PC_1 is equal to -0.38 X_1 + 0.92 X_2")
print("PC_2 is equal to X_3")
print("PC_3 is equal to 0.924 X_1 +  0.383 X_2")

total_var <- sum(eigen(sig)$values)
print("total variance is given by ")
print(total_var)

print("Proportion given by the first component:")
proc_pc1 <- eigen(sig)$values[1] / total_var
print(proc_pc1)

print("Proportion given by the 2nd component:")
proc_pc2 <- eigen(sig)$values[2] / total_var
print(proc_pc2)
