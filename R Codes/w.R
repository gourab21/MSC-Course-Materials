par(mfrow = c(1, 3)) 
x <- seq(-10, 10, length = 200) 

# n = 10 
hist(rnorm(10, mean = 0, sd = 1), main = "n = 10", 
     xlab = "e", prob = TRUE) 
lines(x, dnorm(x), col = "red", lwd = 2) 
# n = 100 
hist(rnorm(100, mean = 0, sd = 1), main = "n = 100", 
     xlab = "e", prob = TRUE) 
lines(x, dnorm(x), col = "red", lwd = 2) 
# n = 1000 
hist(rnorm(1000, mean = 0, sd = 1), main = "n = 1000", 
     xlab = "", prob = TRUE) 
lines(x, dnorm(x), col = "red", lwd = 2) 











# Generate a sequence of x-values from -4 to 4
x <- seq(-4, 4, length.out = 100)

# Calculate the corresponding y-values for the standard normal distribution
y <- dnorm(x, mean = 0, sd = 1)

# Plot the standard normal distribution
plot(x, y, type = "l", col = "blue", lwd = 2, main = "Standard Normal Distribution", 
     xlab = "x", ylab = "Density")

