setwd("G:\\Learn\\Coursera\\Data Science\\3Getting and Cleaning Data\\quiz2")

#4
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)
nchar(htmlCode(10))

#5
data <- read.fwf("wksst8110.for", widths = c(-15, -4, -4, -5, 4, -4, -26), 
         sep = "\n", skip = 4)
sum(data)
