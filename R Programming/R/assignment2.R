##########################################################
## Author - Sachin Grover
## makeCacheMatrix keeps the matrix x and its inverse in a cache. Here cache is nothing but some environment.  
## There are four functions in makeCacheMatrix which are setters and getters for the matrix and the inverse of the matrix
## The functions cacheSolve returns the inverse of a matrix given by x.
##
## Check assignment2_README.md to see how to run the code.
###########################################################
makeCacheMatrix <- function(x = matrix()) {
	cached <- NULL
	
	setMatrix <- function(y){
		x <<- y
		cached <<- NULL
	}

	getMatrix <- function(){
		x
	}

	setInverse <- function(inverse){
		cached <<- inverse
	}

	getInverse <- function(){
		cached
	}

	list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}


## cache solve checks all the environments if the given matrix was saved as the makeCacheMatrix object. If that is saved then the inverse is stored in the object using setInverse function.

cacheSolve <- function(mat, ...) {
	## Return a matrix that is the inverse of 'x'
	inverse <- mat$getInverse()
	
	if(!is.null(inverse)){
		message("getting cached data");
		return(inverse)
	}

	message("data not found in cache, calculating new inverse")
	a <- mat$getMatrix()
	inverse <- solve(a)
	x$setInverse(inverse)

	return(inverse)
}
