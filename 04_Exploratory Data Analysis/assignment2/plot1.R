setwd("G:\\Learn\\Coursera\\Data Science\\4Exploratory Data Analysis\\assignment2")

#Loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot1.png")
data1 <- aggregate(NEI$Emissions, by = list(year = NEI$year), sum)
plot(data1, type = "l", main = "total PM2.5 emission",
     xlab = "Year", ylab = "PM2.5 emission / tons")
dev.off()