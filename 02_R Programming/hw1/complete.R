setwd("D:\\G\\Coursera\\Data Science\\2R Programming\\hw2")
library(VIM)
#1
#complete.cases in VIM
#using VIM package to handle with missing values!!!!!!!!!!!!!

complete <- function(directory, id = 1:332) {
  
  nobs <- c()
  
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
    
    #weak
    #l <- apply(!apply(data, 1, is.na), 2, sum)
    #nob <- sum(l == 4)
    
    #strong
    nob <- nrow(data[complete.cases(data),])

    nobs <- c(nobs, nob)
  }
  ans <- data.frame(id, nobs)
  return(ans)
}