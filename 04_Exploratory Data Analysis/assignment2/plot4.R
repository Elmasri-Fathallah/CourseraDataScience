library(sqldf)

setwd("G:\\Learn\\Coursera\\Data Science\\4Exploratory Data Analysis\\assignment2")

#Loading data
NEI <- readRDS("summarySCC_PM25.rds")
Code <- readRDS("Source_Classification_Code.rds")

png(filename = "plot4.png")
SCCSelect <- as.data.frame(Code[as.vector(agrep("Coal", Code$EI.Sector)),]$SCC)
names(SCCSelect)[1] <- "SCC"
data4 <- subset(NEI, fips == "24510", select = c(year, Emissions, SCC))
data4 <- sqldf("select year, Emissions from data4 
               inner join SCCSelect on data4.SCC = SCCSelect.SCC")
data4 <- aggregate(data4$Emissions, by = list(year = data4$year), sum)
plot(data4, type = "l", main = "coal combustion-related PM2.5 emission",
     xlab = "Year", ylab = "PM2.5 emission / tons")
dev.off()
