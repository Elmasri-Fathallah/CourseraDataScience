# 1
ans1 <- (0.18*2-1.54+0.42*3+0.95) / 7
ans1

# 2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
fit2 <- lm(y ~ x + 0)
ans2 <- fit2$coef[1]
ans2

# 3
fit3 <- lm(mpg ~ wt, data = mtcars)
ans3 <- fit3$coef[2]
ans3

# 6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
ans6 <- (x[1] - mean(x))/sd(x)
ans6

# 7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
fit7 <- lm(y ~ x)
ans7 <- fit7$coef[1]
ans7

# 9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
ans9 <- mean(x)
ans9
