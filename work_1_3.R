# 回归诊断
fit <- lm(weight ~ height, data = women)
opar <- par()
par(mfrow = c(2, 2))
plot(fit)
par(opar)

newfit <- lm(weight ~ height + I(height^2), data = women)
par(mfrow = c(2, 2))
plot(newfit)
par(opar)
