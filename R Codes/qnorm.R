plot(qnorm, pnorm(-4), pnorm(4), lwd = 2,
     xlab = "p", ylab = "Q(p)")
segments(0.5, -4, 0.5, 0, lty = 2, lwd = 2)
segments(0, 0, 0.5, 0, lty = 2, lwd = 2)