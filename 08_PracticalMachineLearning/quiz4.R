library(caret)

# 1
library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 
vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)

set.seed(33833)
fit11 <- train(y ~ ., method = "rf", data = vowel.train)
fit12 <- train(y ~ ., method = "gbm", data = vowel.train)

pred1 <- predict(fit11, vowel.test)
pred2 <- predict(fit12, vowel.test)
val <- vowel.test$y

sum(val == pred1)/length(val)
sum(val == pred2)/length(val)
sum(val == pred1 & val == pred2)/length(val)

# 2
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]
set.seed(62433)
fit21 <- train(diagnosis ~ ., method = "rf", data = training)
fit22 <- train(diagnosis ~ ., method = "gbm", data = training)
fit23 <- train(diagnosis ~ ., method = "lda", data = training)
pred1 <- predict(fit21, testing)
pred2 <- predict(fit22, testing)
pred3 <- predict(fit23, testing)
val <- testing$diagnosis
sum(val == pred1)/length(val)
sum(val == pred2)/length(val)
sum(val == pred3)/length(val)

predDF <- data.frame(pred1, pred2, pred3, diagnosis=testing$diagnosis)
combfit <- train(diagnosis ~ ., method = "rf", data = predDF)
combpred <- predict(combfit, predDF)
sum(val == combpred)/length(val)

# 3
set.seed(3523)
library(AppliedPredictiveModeling)
library(elasticnet)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]
set.seed(233)
fit3 <- enet(x = as.matrix(training[,-9]), y = training[,9], lambda = 0)
plot(fit3)
print(fit3)

# 4
dat = read.csv("gaData.csv")
training = dat[year(dat$date) == 2011,]
testing = dat[year(dat$date) != 2011,]
tstrain = ts(training$visitsTumblr)
tstest = testing$visitsTumblr

fit4 <- bats(tstrain)
pred <- as.data.frame(forecast(fit4, level = c(95), h = length(tstest)))
L <- pred[,2]
H <- pred[,3]

sum(tstest > L & tstest < H)/length(tstest)

# 5
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)
fit5 <- svm(CompressiveStrength ~ ., data = training)
pred <- predict(fit5, testing)
val <- testing$CompressiveStrength
sqrt((sum((pred - val)^2)/length(val)))
