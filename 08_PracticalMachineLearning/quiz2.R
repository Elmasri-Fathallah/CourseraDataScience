# 1
library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
testIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[-testIndex,]
testing = adData[testIndex,]

# 2
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]
qplot(1:774, training$CompressiveStrength, color = as.factor(training$Age))
qplot(1:774, training$CompressiveStrength, color = training$FlyAsh)

# 3
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]
qplot(training$Superplasticizer)
qplot(log(training$Superplasticizer+1))

# 4
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]
varName <- names(training)
data4 <- training[, grep('^IL', varName, perl=TRUE)]
preProcess(data4, method = "pca", thresh = 0.9)

# 5
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

varName <- names(training)
trainData <- training[, grep('^IL', varName, perl=TRUE)]
trainPred <- diagnosis[inTrain]
varName <- names(testing)
testData <- testing[, grep('^IL', varName, perl=TRUE)]
testPred <- diagnosis[-inTrain]

preProc <- preProcess(trainData, method = "pca", thresh = 0.8)
trainPC <- predict(preProc, trainData)
modelFit <- train(trainPred~., method = "glm", data = trainPC)
testPC <- predict(preProc, testData)
confusionMatrix(testPred, predict(modelFit, testPC))

modelFit <- train(trainPred~., method = "glm", data = trainData)
confusionMatrix(testPred, predict(modelFit, testData))

