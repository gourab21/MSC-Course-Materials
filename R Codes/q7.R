# Define two matrices
matrix1 <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
matrix2 <- matrix(c(7, 8, 9, 10, 11, 12), nrow = 3, ncol = 2)

# Function to compute row and column sums
compute_sums <- function(matrix) {
  row_sums <- rowSums(matrix)  # Sum of rows
  col_sums <- colSums(matrix)  # Sum of columns
  
  list(row_sums = row_sums, col_sums = col_sums)
}

# Compute sums for both matrices
sums_matrix1 <- compute_sums(matrix1)
sums_matrix2 <- compute_sums(matrix2)

# Print results for Matrix 1
cat("Matrix 1:\n")
print(matrix1)
cat("\nRow sums of Matrix 1:\n")
print(sums_matrix1$row_sums)
cat("\nColumn sums of Matrix 1:\n")
print(sums_matrix1$col_sums)

# Print results for Matrix 2
cat("\nMatrix 2:\n")
print(matrix2)
cat("\nRow sums of Matrix 2:\n")
print(sums_matrix2$row_sums)
cat("\nColumn sums of Matrix 2:\n")
print(sums_matrix2$col_sums)
