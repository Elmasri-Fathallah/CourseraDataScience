#Coursera 
#Data Science - Getting and Cleaning Data
#Peer Assessments
#hostrue
#2014-5-14

setwd("G:\\Learn\\Coursera\\Data Science\\3Getting and Cleaning Data\\hw")

#step1 
#Merging the training and the test sets into one dataset.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train <- cbind(X_train, Y_train, subject_train)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test <- cbind(X_test, Y_test, subject_test)

set1 <- rbind(train, test)

#step2
#Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- as.character(read.table("./UCI HAR Dataset/features.txt")$V2)
#Using regular expressions to find feature with "mean" or "std" in it
extract <- c(grep("mean", features), grep("std", features))
set2 <- set1[, c(extract, 562, 563)]

#step3
#Uses descriptive activity names to name the activities in the data set
featuresName <- features[extract]
#Rename
names(set2)[1:79] <- featuresName
names(set2)[80] <- "activity"
names(set2)[81] <- "subject"
names(set2)

#step4
#Appropriately labels the data set with descriptive activity names. 
library(doBy)
labels <- as.character(read.table("./UCI HAR Dataset/activity_labels.txt")$V2)
#Recode variable activity from numeric to character
set2$activity <- recodeVar(set2$activity, src = 1:6, tgt = labels)
set2$activity <- factor(set2$activity, order = TRUE, levels = labels)

#step5
#Using "aggregate" to compute mean, group by "activity" and "subject"
attach(set2)
set3 <- aggregate(set2, by = list(activity = activity, subject = subject), 
                  FUN = mean)
set4 <- set3[,1:81]

#export file
write.table(set4, "out.txt", sep = ",")
