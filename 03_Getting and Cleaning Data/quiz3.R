setwd("G:\\Learn\\Coursera\\Data Science\\3Getting and Cleaning Data\\quiz3")

#1
data1 <- read.csv("getdata-data-ss06hid.csv")
agricultureLogical <- data1['ACR'] == 3 & data1['AGS'] == 6
head(data1[which(agricultureLogical),][1], 3)

#2
data2 <- readJPEG("getdata-jeff.jpg", native=TRUE)
quantile(data2, probs = c(0.3, 0.8))

#3
data31 <- read.csv("getdata-data-GDP.csv", skip = 4)
data31 <- data31[1:190,]
data32 <- read.csv("getdata-data-EDSTATS_Country.csv")
names(data31)[1] <- "CountryCode"
names(data31)[4] <- "CountryName"
data3 <- merge(data31, data32, by = "CountryCode", all = FALSE)
GDP <- as.numeric(gsub(",", "", as.character(data3[['X.4']])))
data3 <- cbind(data3, GDP)
data3 <- subset(data3, select = c(CountryCode, CountryName, Income.Group, GDP))
data3 <- data3[order(-GDP),]
GDPRank <- 1:189
data3 <- cbind(data3, GDPRank)
data3[13,2]

#4
by(data3$GDPRank, data3$Income.Group, mean)

#5
library(Hmisc)
data3$Group <- cut2(data3$GDPRank, g = 5)
table(data3$Group, data3$Income.Group)
