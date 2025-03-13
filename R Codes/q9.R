# Function to check if a number is prime or composite
check_prime_composite <- function(n) {
  if (n <= 1) {
    return("Neither prime nor composite")
  }
  
  # Check divisibility from 2 to sqrt(n)
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) {
      return("Composite")
    }
  }
  
  return("Prime")
}

# Take user input
num <- as.integer(readline(prompt = "Enter a number: "))

# Check if the number is prime or composite
result <- check_prime_composite(num)

# Print the result
cat("The number", num, "is", result)
