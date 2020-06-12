## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix<-function(x=matrix())
{
  m<-NULL
  set<- function(y) {
    x<<-y
    m<<-NULL
  }
  get<- function() x
  setInverse<- function(inverse) m<<-inverse
  getInverse<-function() m
  list(set=set,get=get,setInverse=setInverse,getInverse=getInverse) ## returns a list contaning the functions set,get,setInverse,getInverse
}

## Write a short comment describing this function

cacheSolve<-function(x,...)
{
  m<-x$getInverse()
  if(!is.null(m)) {   ## code to check if the inverse is already kept in the cache
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,...) ## finding the inverse of the matrix
  x$setInverse(m)
}


## Use the below code to check your matrix. I have created a sample:

A<-matrix(c(13,4,6,4,2,76,59,3,23),3,3)
list_matrix<-makeCacheMatrix(A)
cacheSolve(list_matrix)
