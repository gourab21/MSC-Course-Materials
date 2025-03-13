par(mfrow = c(1, 2))
dev.new(width=20, height=10, unit="in")
# Grid of X-axis values
x <- seq(-4, 8, 0.1)

#-----------------------------------------
# Same standard deviation, different mean
#-----------------------------------------
# Mean 0, sd 1
plot(x, pnorm(x, mean = 0, sd = 1), type = "l",
     ylim = c(0, 1), ylab = "Cumulative Density", lwd = 2, col = "red")
# Mean 3, sd 1
lines(x, pnorm(x, mean = 3, sd = 1), col = "blue", lty = 1, lwd = 2)

# Legend
legend("topleft", legend = c("0 1", "3 1"), col = c("red", "blue"),
       title = expression(paste(mu, " ", sigma)),
       title.adj = 0.9, lty = 1, lwd = 2, box.lty = 0)

#-----------------------------------------
# Same mean, different standard deviation
#-----------------------------------------
dev.new(width=20, height=10, unit="in")
# Mean 1, sd 1
plot(x, pnorm(x, mean = 1, sd = 1), type = "l",
     ylim = c(0, 1), ylab = "Cumulative Density", lwd = 2, col = "red")
# Mean 1, sd 0.5
lines(x, pnorm(x, mean = 1, sd = 0.5), col = "blue", lty = 1, lwd = 2)

# Legend
legend("topleft", legend = c("1 1", "1 0.5"), col = c("red", "blue"),
       title = expression(paste(mu, " ", sigma)),
       title.adj = 0.75, lty = 1, lwd = 2, box.lty = 0)

par(mfrow = c(1, 1))