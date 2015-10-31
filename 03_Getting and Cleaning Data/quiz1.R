#1
data1 <- read.csv("getdata-data-ss06hid.csv")
ans1 <- nrow(subset(data1, VAL == 24 & TYPE == 1))

#2
data2 <- subset(data1, select = FES)

#3
library(xlsx)
dat <- read.xlsx("getdata-data-DATA.gov_NGAP.xlsx", sheetIndex = 1,
                colIndex = 7:15, rowIndex = 18:23)
ans3 <- sum(dat$Zip*dat$Ext,na.rm=T) 

#4
library(XML)
doc <- xmlTreeParse("getdata-data-restaurants.xml", useInternal = TRUE, encoding="UTF-8")
rootNode <- xmlRoot(doc)
#xmlName(rootNode)
re <-  xpathSApply(rootNode, "//zipcode", xmlValue)
ans4 <- sum(re == 21231)

#5
library(data.table)
DT <- fread("getdata-data-ss06pid.csv")
mean(DT$pwgtp15,by=DT$SEX)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
DT[,mean(pwgtp15),by=SEX]
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
rowMeans(DT)[DT$SEX==1]
rowMeans(DT)[DT$SEX==2]
