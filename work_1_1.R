# 简单线性回归
fit = lm (weight ~ height, data = women)
summary (fit);  coefficients (fit)
fitted (fit);   anova (fit);  vcov (fit)
residuals (fit); predict (fit)
confint (fit)
plot (women$height, women$weight, main = "Women Age 30-39", xlab = "Height (in inches)", ylab = "Weight (in pounds)")
abline (fit)
