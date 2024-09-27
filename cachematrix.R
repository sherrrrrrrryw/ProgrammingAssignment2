## The following two functions are used to create a special
## object that stores a matrix and cache's its inverse.

## The first function 'makeCacheMatrix' creates a matrix
## that is a list containing a function to set and get
## the value of the matrix and the inverse.

makeCacheMatrix <- function(x = matrix()) {
                i <- NULL
                set <- function(y){
                                x <<- y
                                i <<- NULL
                }
                get <- function() x
                setinverse <- function(inverse) i <<- inverse
                getinverse <- function() i
                list(set = set,
                     get = get,
                     setinverse = setinverse,
                     getinverse = getinverse)

}


## The second function calculates the inverse of the matrix created with the previous function.


cacheSolve <- function(x, ...) {
                i <- x$getinverse()
                if(!is.null(i)){
                                message("getting cached data")
                                return(i)
                }
                data <- x$get()
                i <- solve(data)
                x$setinverse(i)
                i
        ## Return a matrix that is the inverse of 'x'
}
