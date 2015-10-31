#Programming Assignment 2

# makeCacheMatrix create an object (list) that holds 4 element.
# Namely, data of matrix (x) and its inverse matrix (inv), 
# and access function to each of these data (get, set, setinv, getinv).

# m <- matrix(1:4, nrow=2, ncol=2)
# CM <- makeCacheMatrix(m)

makeCacheMatrix <- function(x = matrix()) {
  
  #Object to contain inverse of matrix x
  inv <- NULL
  
  #set value of matrix x
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  #get value of matrix x
  get <- function() x
  
  #set the value of inverse of x
  setinv <- function(inverse) inv <<- inverse
  
  #get the value of inverse of x
  getinv <- function() inv
  
  
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}



# cacheSolve receives an object that created by makeCacheMatrix(),
# and calculate inverse matrix by using the data that stored in that object,
# and stored the result in that object as cache.

# cacheSolve(CM)

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  
  data<-x$get
  inv<-solve(data, ...)
  x$setinv(inv)
  return(inv)
}