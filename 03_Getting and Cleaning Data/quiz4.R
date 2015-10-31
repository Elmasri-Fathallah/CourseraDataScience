setwd("G:\\Learn\\Coursera\\Data Science\\3Getting and Cleaning Data\\quiz4")

#1
data1 <- read.csv("getdata-data-ss06hid.csv")
strsplit(names(data1), "wgtp")[123]

#2
data2 <- read.csv("getdata-data-GDP.csv", skip = 4)
data2 <- data2[1:190,]
names(data2)[1] <- "CountryCode"
data2$GDP <- as.numeric(gsub(",", "", as.character(data2[['X.4']])))
mean(data2$GDP)

#3
countryNames <- as.character(data2$X.3)
grep("^United", countryNames)

#4
data3 <- read.csv("getdata-data-EDSTATS_Country.csv")
data4 <- merge(data2, data3, by = "CountryCode", all = FALSE)
length(grep("^Fiscal year end: June", data4$Special.Notes))

#5
library(quantmod)
library(lubridate)
amzn <- getSymbols("AMZN",auto.assign=FALSE)
sampleTimes <- index(amzn)
sum(year(sampleTimes) == 2012)
sum(year(sampleTimes) == 2012 & wday(sampleTimes) == 2)
