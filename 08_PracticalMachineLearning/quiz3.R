# 1
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
train <- subset(segmentationOriginal, Case == "Train")[,-1:-2]
test <- subset(segmentationOriginal, Case == "Test")[,-1:-2]
set.seed(125)
fit1 <- train(Class ~ ., method = "rpart", data = train)
case <- train[1:4,]
fit1$finalModel
plot(fit1$finalModel, uniform = TRUE)

# 3
library(pgmm)
data(olive)
olive = olive[,-1]
fit3 <- train(Area ~ ., method = "rpart", data = olive)
newdata = as.data.frame(t(colMeans(olive)))
predict(fit3$finalModel, newdata = newdata)

# 4
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]
set.seed(13234)
fit4 <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl, 
              method = "glm", family="binomial", data = trainSA)
pred <- predict(fit4, testSA)
val <- testSA[,"chd"]

missClass = function(values,prediction){
  sum(((prediction > 0.5)*1) != values)/length(values)
}

missClass(val, pred)

# 5
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)
vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)
dat <- rbind(vowel.train, vowel.test)
set.seed(33833)
fit5 <- train(y ~ ., method = "rf", data = dat)
varImp(fit5)
