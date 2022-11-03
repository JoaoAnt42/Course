a <- 1
b <- 2
c <- a + b
print(c)

N <- matrix(c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4), nrow = 4)
print(N)
M <- matrix(c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4), nrow = 4, byrow = T)
print(M)
print(M[1, ])
print(M[2, ])

print(M[1, ] + M[2, ])
print(t(M[1, ]))
print("Double trasnpose")
print(t(t(M[1, ])))

print("Multiply two matrix")
print(M[1, ] %*% M[2, ])
