##How to run the code

* define a nXn matrix using 
`> mat <- matrix(rnorm(n^2), n, n)`

* make a cache matrix object
`> x <- makeCacheMatrix(mat)`

* now solve for inverse of x
`> cacheSolve(x)`

When you run cacheSolve the second time then the inverse will be picked from cached data.

## Results
The results are for 4X4 matrix

original matrix
`
      [,1]       [,2]        [,3]       [,4]
[1,] -0.3454332  1.4800938  0.08003306 -0.1571537
[2,] -0.5450557  0.1696299 -0.47745683  0.1408797
[3,]  0.6812954 -0.5674873  0.76083124 -0.2076304
[4,] -1.0186934 -0.4415876 -0.21379211  0.5489351

`
first call for cacheSolve
`
> cacheSolve(x)
data not found in cache, calculating new inverse
      [,1]        [,2]      [,3]        [,4]
[1,] -0.6971387  -5.5199376 -3.411257 -0.07321693
[2,]  0.4004036  -2.5922970 -1.622161  0.16635328
[3,]  0.7359825  -0.3974825  1.203254  0.76783551
[4,] -0.6849808 -12.4838596 -7.166794  2.11870427
`

second call for cacheSolve
`
> cacheSolve(x)
getting cached data
	  [,1]        [,2]      [,3]        [,4]
[1,] -0.6971387  -5.5199376 -3.411257 -0.07321693
[2,]  0.4004036  -2.5922970 -1.622161  0.16635328
[3,]  0.7359825  -0.3974825  1.203254  0.76783551
[4,] -0.6849808 -12.4838596 -7.166794  2.11870427
`
