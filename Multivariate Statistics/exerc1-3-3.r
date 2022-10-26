# a <- 1
# b <- 2
# c <- a + b
# print(c)

N <- matrix(c(25, -2, 4, -2, 4, 1, 4, 1, 9), nrow = 3)
print(N)
X <- matrix(c(3, -1, 2), nrow = 1)
print(X)

print(X %*% N %*% t(X))

N2 <- matrix(c(1, 1, 0, -1, 1, 0, 0, 0, 0), nrow = 3)
print(N2 %*% N %*% t(N2))


# print(N)
# M <- matrix(c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4), nrow = 4, byrow = T)
# print(M)
# print(M[1, ])
# print(M[2, ])

# print(M[1, ] + M[2, ])
# print(t(M[1, ]))
# print("Double trasnpose")
# print(t(t(M[1, ])))

# print("Multiply two matrix")
# print(M[1, ] %*% M[2, ])
