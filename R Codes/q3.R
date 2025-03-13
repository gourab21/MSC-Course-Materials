# Create a data frame
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Score = c(85, 90, 95)
)

# Check the class of the original object
print(paste("Class of the Original object:",class(df)));

# Print the original data frame
print("Original Data Frame:")
print(df)

# Convert the data frame into a matrix
matrix_conversion <- as.matrix(df)

# Print the converted matrix
print("Converted Matrix:")
print(matrix_conversion)

# Check the class of the converted object
print("Class of the converted object:")
print(class(matrix_conversion))
