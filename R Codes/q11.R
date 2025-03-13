# Function to find factors of a given number
find_factors <- function(n) {
  factors <- c()  # Initialize an empty vector to store factors
  
  # Loop from 1 to n to find the factors
  for (i in 1:n) {
    if (n %% i == 0) {  # Check if i is a divisor of n
      factors <- c(factors, i)  # Add i to the factors list
    }
  }
  
  return(factors)
}

# Take input from the user
num <- as.integer(readline(prompt = "Enter a number: "))

# Find and print the factors
factors <- find_factors(num)
cat("Factors of", num, "are:", factors, "\n")
