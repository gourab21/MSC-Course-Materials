x <- seq(0, 1, by = 0.02)

y <- qnorm(x, mean(x), sd(x))

# output to be present as PNG file
#png(file = "qnormExample.png")

# Plot the graph.
plot(x, y, type = "l", col = "blue", lwd = "5", xlab = "P", ylab = "Q(p)", main ="q_norm", col.main = "black")
axis(1, col.axis = "black", col.ticks = "blue", lwd = 2)
axis(2, col.axis = "black", col.ticks = "black", lwd = 2)


grid(col = "gray")