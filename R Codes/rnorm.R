par(mfrow = c(1, 3))
x <- seq(-10, 10, length = 200)
set.seed(3)
# n = 10
hist(rnorm(10, mean = 0, sd = 1), main = "n = 10",
     xlab = "", prob = TRUE)
lines(x, dnorm(x), col = "red", lwd = 2)
# n = 100
hist(rnorm(100, mean = 0, sd = 1), main = "n = 100",
     xlab = "", prob = TRUE)
lines(x, dnorm(x), col = "red", lwd = 2)
# n = 1000
hist(rnorm(1000, mean = 0, sd = 1), main = "n = 1000",
     xlab = "", prob = TRUE)
lines(x, dnorm(x), col = "red", lwd = 2)
par(mfrow = c(1, 1))