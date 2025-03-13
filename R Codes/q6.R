# Define two matrices
matrix1 <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)
matrix2 <- matrix(c(5, 6, 7, 8), nrow = 2, ncol = 2)

# Print the matrices
cat("Matrix 1:\n")
print(matrix1)

cat("\nMatrix 2:\n")
print(matrix2)

# Perform matrix multiplication
result <- matrix1 %*% matrix2

# Print the result
cat("\nResult of Matrix Multiplication:\n")
print(result)
