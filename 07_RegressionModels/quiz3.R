# 1
data(mtcars)
fit1 <- lm(mpg ~ wt + factor(cyl), data = mtcars)
summary(fit1)

# 3
library(lmtest)
data(mtcars)
fit31 <- fit1
summary(fit31)
fit32 <- lm(mpg ~ wt + factor(cyl) + wt:factor(cyl), data = mtcars)
summary(fit32)
lrtest(fit31, fit32)

# 5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit5 <- lm(y ~ x)
influence(fit5)

# 6
fit6 <- fit5
dfbetas(fit6)
