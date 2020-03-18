# 注释：command+shift+C

# 清除变量
rm(list = ls())

# 向量
a = c(1,2,3,4)
b = c("one","two","three")
c = c(TRUE,FALSE)
print('# 向量')
cat(a, b, c, '\n\n')

# 帮助
help("matrix")

# 矩阵
mdat = matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = TRUE, 
               dimnames = list(c("row1", "row2"), c("C.1", "C.2", "C.3")))
print(mdat)

# 数组
arr = array(1:3, c(2,4,3))
print(arr)

# 数据帧
fra = data.frame(1, 1:10, sample(LETTERS[1:3], 10, replace = TRUE))
print(fra)

# 因子
apple_colors = c('green','green','yellow','red','red','red','green')
factor_apple = factor(apple_colors)
print(factor_apple)
print(nlevels(factor_apple))

# 列表
lis = list(c(2,5,8), 52.8, TRUE)
print(lis)

# 成员运算符 %in%
v1 = 8
t = 1:10
print(v1 %in% t)

# 矩阵乘 %*%
m1 = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
print(m1)
m2 = matrix( c(2,6,5,1,10,4), nrow = 3,ncol = 2,byrow = TRUE)
print(m2)
t = m1 %*% m2
print(t)

# 求余、求模
t1 = 8 %% 3
cat('8 %% 3 =', t1, '\n')
t2 = 8 %/% 3
cat('8 %/% 3 =', t2, '\n')

# 函数
new.function = function(a){
  for(i in 1:a){
    b = i^2
    print(b)
  }
}
new.function(10)

