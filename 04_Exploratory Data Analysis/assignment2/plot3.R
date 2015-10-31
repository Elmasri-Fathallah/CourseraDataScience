library(ggplot2)

setwd("G:\\Learn\\Coursera\\Data Science\\4Exploratory Data Analysis\\assignment2")

#Loading data
NEI <- readRDS("summarySCC_PM25.rds")
Code <- readRDS("Source_Classification_Code.rds")

png(filename = "plot3.png")
data3 <- subset(NEI, fips == "24510", select = c(year, Emissions, type))
data3 <- aggregate(data3$Emissions, 
                   by = list(year = data3$year, type = data3$type), sum)
qplot(data3$year, data3$x, geom = c("line"), colour = data3$type,
      main = "total PM2.5 emission in Baltimore City, Maryland",
      xlab = "Year", ylab = "PM2.5 emission / tons")
dev.off()
