#Calculate probability that an object has weight<=1010 i.e, P(X>1080)
Mean <- 1000
Sd <- 10

# X grid for non-standard normal distribution
x <- seq(-3, 3, length = 100) * Sd + Mean 

# Density function
f <- dnorm(x, Mean, Sd)

lb <- min(x) # Lower bound
ub <- 1010   # Upper bound

x2 <- seq(lb, ub, length = 100) # New Grid
y <- dnorm(x2, Mean, Sd) # Density

plot(x, f, type = "l", lwd = 2, col = "blue", ylab = "Density", xlab = "Weight")
 

polygon(c(lb, x2, ub), c(0, y, 0), col = rgb(0, 0, 1, alpha = 0.5))
per=pnorm(1010, Mean, Sd,lower.tail = TRUE)
per=round(per,4)
t=paste(per*100,"%");
text(1020, 0.035,t )