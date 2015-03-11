pollutantmean <- function(directory, pollutant, id = 1:332) {
	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files

	## 'pollutant' is a character vector of length 1 indicating
	## the name of the pollutant for which we will calculate the
	## mean; either "sulfate" or "nitrate".

	## 'id' is an integer vector indicating the monitor ID numbers
	## to be used
	
	## Return the mean of the pollutant across all monitors list
	## in the 'id' vector (ignoring NA values)
	mean <- vector(length = length(id))
	index <- 1
	for(i in id){
		file <- getFileName(i)
		data <- read.csv(file)
		
		mean[index] <- mean(data[pollutant], na.rm = TRUE)
		index <- index+1
	}

	mean
}

getFileName <- function(d, x){
	if(i < 10){
		file <- paste(d, as.character("/00"), as.character(i), ".csv", sep="")
	} else if(i <100) {
		file <- paste(d, as.character("/0"), as.character(i), ".csv", sep="")
	} else {
		file <- paste(d, "/", as.character(i), ".csv", sep="")
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
		file <- getFileName(i)
		data <- read.csv(file)

		good <- complete.cases(data)
		nobs[value] <- nrow(data[good, ])
	}
	data.frame(id, nobs)
}

corr <- function(directory, threshold = 0) {
	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files

	## 'threshold' is a numeric vector of length 1 indicating the
	## number of completely observed observations (on all
	## variables) required to compute the correlation between
	## nitrate and sulfate; the default is 0

	## Return a numeric vector of correlations
	
	compCases <- complete(directory)
	ids <- complete$id[compCases$nobs > threshold]
	
	correlation <- vector(length = length(ids))
	index <- 1
	for(i in ids){
		file <- getFileName(i)
		correlation[index] <- cor(file$sulfate, file$nitrate, use="complete.obs")
		index <- index+1
	}
	correlation
}
