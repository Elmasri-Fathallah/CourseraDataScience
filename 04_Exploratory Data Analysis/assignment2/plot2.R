setwd("G:\\Learn\\Coursera\\Data Science\\4Exploratory Data Analysis\\assignment2")

#Loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot2.png")
data2 <- subset(NEI, fips == "24510", select = c(year, Emissions))
data2 <- aggregate(data2$Emissions, by = list(year = data2$year), sum)
plot(data2, type = "l", main = "total PM2.5 emission in Baltimore City, Maryland",
     xlab = "Year", ylab = "PM2.5 emission / tons")
dev.off()
