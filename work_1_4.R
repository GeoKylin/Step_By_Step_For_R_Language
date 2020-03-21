# 回归诊断
library (car)
fit <- lm(weight ~ height, data = women)
qqPlot (fit)     #正态性
durbinWatsonTest (fit)     #自相关
crPlots (fit)     #线性
ncvTest (fit)     #同方差性
outlierTest (fit)     #离群点
