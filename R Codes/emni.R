# Function to calculate row sums and column sums
calculate_sums <- function(matrix_input) {
  # Row sums
  row_sums <- rowSums(matrix_input)
  
  # Column sums
  col_sums <- colSums(matrix_input)
  
  # Print the results
  cat("Row sums:\n")
  print(row_sums)
  
  cat("Column sums:\n")
  print(col_sums)
}




a <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, byrow = FALSE)
r=2
c=3
t=as.list(a)
b=matrix(0,nrow=c,ncol=2)
for (i in 1:c){
  for (j in 1:r){
    b[i,j]=a[j,i]
  }
}







# Ask the user for the matrix dimensions (rows and columns)
rows <- as.integer(readline(prompt = "Enter number of rows: "))
cols <- as.integer(readline(prompt = "Enter number of columns: "))

# Create an empty matrix
user_matrix <- matrix(numeric(rows * cols), nrow = rows, ncol = cols)

# Ask the user to fill the matrix
cat("Enter the elements of the matrix row by row (space-separated):\n")
for (i in 1:rows) {
  row_input <- readline(prompt = paste("Enter row", i, ": "))
  user_matrix[i, ] <- as.numeric(strsplit(row_input, " ")[[1]])
}

# Display the matrix
cat("Your matrix is:\n")
print(user_matrix)

# Calculate and display row and column sums
calculate_sums(user_matrix)
