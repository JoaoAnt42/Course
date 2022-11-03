# Ex. 2.4
# Var(X)
sig <- matrix(c(4, -2, -2, 2), nrow = 2)
print(sig)

print(-2 * log(sqrt(det(sig)) * 0.03 * 2 * pi, base = exp(1)))

# Eigenvalues of Sigma
# solve(x) return inverse matrix x^-1
print("Eigen values of Sigma, measurements of the semi axis of the elipse")
print(eigen(solve(sig)))
