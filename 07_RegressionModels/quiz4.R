library(MASS)

# 1
data(shuttle)
use <- as.numeric(shuttle$use) - 1
wind <- as.numeric(shuttle$wind)
fit1 <- glm(use ~ wind, family = binomial())
summary(fit1)
exp(coef(fit1))

# 2
data(shuttle)
use <- as.numeric(shuttle$use) - 1
wind <- as.numeric(shuttle$wind)
fit2 <- glm(use ~ wind + magn, data = shuttle, family = binomial())
summary(fit2)
exp(coef(fit2))

# 3
use <- 1 - (as.numeric(shuttle$use) - 1)
wind <- as.numeric(shuttle$wind)
fit3 <- glm(use ~ wind, family = binomial())
summary(fit3)
summary(fit1)

# 4
data(InsectSprays)
fit4 <- glm(count ~ as.factor(spray), data = InsectSprays, family = poisson)
coef(fit4)

# 5
x <- 0:5
y <- c(0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
plot(x,y)
lm(y~x)
