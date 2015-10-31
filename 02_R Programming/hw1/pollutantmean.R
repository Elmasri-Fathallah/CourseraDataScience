setwd("G:\\Learn\\Coursera\\Data Science\\2R Programming\\hw2")

#1
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  i = 0
  ans = 0
  
  sum = 0
  count = 0
  
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
    sum <- sum + apply(data[pollutant], 2, sum, na.rm = TRUE)
    count <- count + sum(!is.na(data[pollutant]))
  }
  ans <- sum/count
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  return(ans)
  
}