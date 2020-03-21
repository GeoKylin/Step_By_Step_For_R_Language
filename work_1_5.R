states <- as.data.frame (state.x77[, c("Murder", "Population", "Illiteracy", "Income", "Frost")])
cor(states)
library(car)
scatterplotMatrix(states, spread = FALSE, lty.smooth = 2, main = "Scatterplot Matrix")

# 简单的多元线性回归
fit <- lm(Murder ~ Population + Illiteracy + Income+Frost , data = states)
summary(fit)

# 有交互项的多元线性回归
fit1 <- lm(Murder ~ Population + Illiteracy + Illiteracy: Population, data = states)
summary(fit1)

# 回归诊断
fit <- lm(Murder ~ Population + Illiteracy + Income +
            Frost, data=states)
opar <- par()
par(mfrow = c(2, 2))
plot(fit)
par(opar)
confint(fit)
library(car)
qqPlot(fit, labels = FALSE, simulate = TRUE, main = "Q-Q Plot")

# 回归诊断
library (car)
qqPlot(fit, labels = FALSE, simulate = TRUE, main = 'Q-Q Plot')              #正态性
durbinWatsonTest (fit)     #自相关
crPlots (fit)     #线性
ncvTest (fit)     #同方差性
outlierTest (fit)     #离群点
vif(fit); sqrt(vif(fit)) > 2  #多重共线性

# 线性模型假设的综合验证
library(gvlma)
gvmodel <- gvlma(fit)
summary(gvmodel)

# 异常观测值
library (car)
influencePlot(fit, id.method = "identify")

# Box-Cox正态变换
library(car)
summary(powerTransform(states$Murder))

# Box-Tidwell变换
library(car)
boxTidwell(Murder ~ Population + Illiteracy, data = states)

# 当模型存在异方差时，可对响应变量进行某种变换
library(car); spreadLevelPlot(fit)

# 选择“最佳”的回归模型
# 比较两个嵌套模型
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
fit2 <- lm(Murder ~ Population + Illiteracy, data = states)
anova(fit2, fit1)

# 选择“最佳”的回归模型
# 赤池信息准则
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
fit2 <- lm(Murder ~ Population + Illiteracy, data = states)
AIC(fit1, fit2)

# 向后逐步回归
library(MASS)
fit1 <- lm(Murder ~ Population + Illiteracy + Income + 
             Frost, data = states)
stepAIC(fit, direction = "backward")

# 全子集回归
library(leaps)
leaps <- regsubsets(Murder ~ Population + Illiteracy + Income + Frost, data = states, nbest = 4)
plot(leaps, scale = "adjr2")
library(car)
subsets(leaps, statistic = "cp",  main = "Cp Plot for All Subsets Regression")
abline(1, 1, lty = 2, col = "red")


