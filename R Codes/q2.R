# Define the number of rows and columns
n_rows <- 3
n_cols <- 4

# Create a sequence of numbers to fill the matrix
values <- 1:(n_rows * n_cols)

# Create the matrix in column-major order
matrix_cm <- matrix(values, nrow = n_rows, ncol = n_cols, byrow = FALSE)

# Print the matrix
print("Matrix in column-major order:")
print(matrix_cm)

# Access elements in column-major order
print("Accessing elements in column-major order:")
for (col in 1:ncol(matrix_cm)) {
  for (row in 1:nrow(matrix_cm)) {
    print(paste("Element at row", row, "and column", col, ":", matrix_cm[row, col]))
  }
}
