# Function to check if a matrix is symmetric
is_symmetric <- function(matrix) {
  if (!is.matrix(matrix)) {
    return(FALSE)  # Not a matrix
  }
  if (nrow(matrix) != ncol(matrix)) {
    return(FALSE)  # Not square
  }
  return(all(matrix == t(matrix)))  # Check symmetry
}

# Define two matrices
matrix1 <- matrix(c(1, 2, 3, 2, 4, 5, 3, 5, 6), nrow = 3, ncol = 3)
matrix2 <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, ncol = 3)

# Check if each matrix is symmetric
result1 <- is_symmetric(matrix1)
result2 <- is_symmetric(matrix2)

# Print results
cat("Matrix 1:\n")
print(matrix1)
cat("Is Matrix 1 symmetric? ", result1, "\n\n")

cat("Matrix 2:\n")
print(matrix2)
cat("Is Matrix 2 symmetric? ", result2, "\n")
