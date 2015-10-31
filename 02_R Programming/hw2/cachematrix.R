## Caching the Inverse of a Matrix
## hostrue

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  matrix <- NULL
  set <- function(y) {
    x <<- y
    matrix <<- NULL
  }
  get <- function() x
  setinv <- function(solve) matrix <<- solve
  getinv <- function() matrix
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated (and 
## the matrix has not changed), then cacheSolve should retrieve the inverse 
## from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  matrix <- x$getinv()
  if(!is.null(matrix)) {
    message("getting cached matrix")
    return(matrix)
  }
  data <- x$get()
  matrix <- inv(data, ...)
  x$setinv(matrix)
  matrix
}
