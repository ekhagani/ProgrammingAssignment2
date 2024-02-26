## This function get inversion of given matrix and sets it in cache 

makeCacheMatrix <- function(x = matrix()) {
        invMatrix <- NULL  # Placeholder for the inverse matrix
    
    # Function to set the matrix and clear the stored inverse
    setMatrix <- function(newMatrix) {
        matrix <<- newMatrix
        invMatrix <<- NULL
    }
    
    # Function to get the current matrix
    getMatrix <- function() matrix
    
    # Function to calculate and set the inverse of the current matrix
    setInversion <- function() {
        invMatrix <<- solve(matrix)
    }
    
    # Function to get the inverse of the matrix, calculating it if necessary
    getInversion <- function() {
        if (is.null(invMatrix)) {
            setInversion()
        }
        invMatrix
    }
    
    # Return a list of the functions for external use
    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setInversion = setInversion, getInversion = getInversion)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
# Attempt to get the cached inversion
  invMatrix <- matrixObject$getInversion()
  
  # Check if the inversion has not been computed and cached
  if (is.null(invMatrix)) {
    # Compute and cache the inversion
    matrixObject$setInversion()
    # Retrieve the newly computed inversion
    invMatrix <- matrixObject$getInversion()
  }
  
  # Return the inversion matrix
  return(invMatrix)
}
