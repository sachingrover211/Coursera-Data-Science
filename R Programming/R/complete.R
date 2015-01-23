getFileName <- function(d, x){
	if(x < 10){
		file <- paste(d, as.character("/00"), as.character(x), ".csv", sep="")
	} else if(x <100) {
		file <- paste(d, as.character("/0"), as.character(x), ".csv", sep="")
	} else {
		file <- paste(d, "/", as.character(x), ".csv", sep="")
	}
	
	file
}

complete <- function(directory, id = 1:332) {
	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files

	## 'id' is an integer vector indicating the monitor ID numbers
	## to be used
	        
	## Return a data frame of the form:
	## id nobs
	## 1  117
	## 2  1041
	## ...
	## where 'id' is the monitor ID number and 'nobs' is the
	## number of complete cases
	nobs <- vector(length = length(id))
	index <- 1
	for(i in id){
		file <- getFileName(directory, i)
		data <- read.csv(file)

		good <- complete.cases(data)
		nobs[index] <- nrow(data[good, ])
		index <- index+1
	}
	data.frame(id, nobs)
}