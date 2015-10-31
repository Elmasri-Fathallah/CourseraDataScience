library(sqldf)

setwd("G:\\Learn\\Coursera\\Data Science\\4Exploratory Data Analysis\\assignment2")

#Loading data
NEI <- readRDS("summarySCC_PM25.rds")
Code <- readRDS("Source_Classification_Code.rds")

png(filename = "plot6.png")
SCCSelect <- as.data.frame(Code[as.vector(agrep("vehicle", Code$EI.Sector)),]$SCC)
names(SCCSelect)[1] <- "SCC"
data61 <- subset(NEI, fips == "24510", select = c(year, Emissions, SCC))
data62 <- subset(NEI, fips == "06037", select = c(year, Emissions, SCC))
data61 <- sqldf("select year, Emissions from data61 
               inner join SCCSelect on data61.SCC = SCCSelect.SCC")
data62 <- sqldf("select year, Emissions from data62 
               inner join SCCSelect on data62.SCC = SCCSelect.SCC")
data61 <- aggregate(data61$Emissions, by = list(year = data61$year), sum)
data62 <- aggregate(data62$Emissions, by = list(year = data62$year), sum)
par(mfrow = c(1,2))
plot(data61, type = "l", main = "motor vehicle PM2.5 in Baltimore",
     xlab = "Year", ylab = "PM2.5 emission / tons")
plot(data62, type = "l", main = "motor vehicle PM2.5 in Los Angeles",
     xlab = "Year", ylab = "PM2.5 emission / tons")
dev.off()
