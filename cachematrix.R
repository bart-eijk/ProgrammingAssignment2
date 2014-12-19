## The above two functions are used to create a matrix, that caches the
## matrix' inverse. Using solve() to compute a matrix' inverse is a
## costly operation, therefore caching it makes sense.

## makeCacheMatrix creates an object that contains the original matrix
## (and later on the cached inverse matrix). It has a total of four methods,
## your classic getters and setters.
##
## Example usage: cm <- makeCacheMatrix(yourmatrix)

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## cacheSolve will return the inverse matrix of a makeCacheMatrix-object.
## If no cached inverse matrix is stored, it us computed. If an inverse
## is stored, it will be returned.
##
## Example usage: cacheSolve(cm)

cacheSolve <- function(x, ...) {
    s <- x$getsolve()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}
