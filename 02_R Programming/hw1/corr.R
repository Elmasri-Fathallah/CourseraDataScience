setwd("D:\\G\\Coursera\\Data Science\\2R Programming\\hw2")

#1
#na.omit of VIM
corr <- function(directory, threshold = 0) {
  
  ans <- c()
  
  id <- 1:332
  for (i in id){
    if(1 <= i & i <= 9){
      path <- paste(directory, "\\00", i, ".csv", sep = "")
    }
    else if(10 <= i & i <= 99){
      path <- paste(directory, "\\0", i, ".csv", sep = "")
    }
    else{
      path <- paste(directory, "\\", i, ".csv", sep = "")
    }
    data <- read.csv(path)
    l <- apply(!apply(data, 1, is.na), 2, sum)
    nob <- sum(l == 4)
    data1 <- subset(data, !is.na(sulfate) & !is.na(nitrate))
    if(nob > threshold){
      ans <- c(ans, cor(data1$sulfate, data1$nitrate))
    }
  }
  
  return(ans)
  
}