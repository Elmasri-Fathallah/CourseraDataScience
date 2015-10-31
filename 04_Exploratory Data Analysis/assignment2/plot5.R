library(sqldf)

setwd("G:\\Learn\\Coursera\\Data Science\\4Exploratory Data Analysis\\assignment2")

#Loading data
NEI <- readRDS("summarySCC_PM25.rds")
Code <- readRDS("Source_Classification_Code.rds")

png(filename = "plot5.png")
SCCSelect <- as.data.frame(Code[as.vector(agrep("vehicle", Code$EI.Sector)),]$SCC)
names(SCCSelect)[1] <- "SCC"
data5 <- subset(NEI, fips == "24510", select = c(year, Emissions, SCC))
data5 <- sqldf("select year, Emissions from data5 
               inner join SCCSelect on data5.SCC = SCCSelect.SCC")
data5 <- aggregate(data5$Emissions, by = list(year = data5$year), sum)
plot(data5, type = "l", main = "motor vehicle PM2.5 emission",
     xlab = "Year", ylab = "PM2.5 emission / tons")
dev.off()
