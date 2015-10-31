# 1,2
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit1 <- lm(y~x)
summary(fit1)

# 3
fit3 <- lm(mpg ~ wt, data = mtcars)
newdata <- data.frame(wt = mean(mtcars$wt))
predict(fit3, newdata,  interval=("confidence"))

# 5
fit5 <- lm(mpg ~ wt, data = mtcars)
newdata <- data.frame(wt = c(3))
predict(fit5, newdata,  interval=("prediction"))

# 6
fit6 <- lm(mpg ~ wt, data = mtcars)
sumCoef <- summary(fit6)$coefficients
2 * (sumCoef[2,1] - qt(.975, df = fit6$df) * sumCoef[2, 2])
