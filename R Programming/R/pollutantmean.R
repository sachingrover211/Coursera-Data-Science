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
	
	index <- 1
	data <- data.frame()
	for(i in id){
		file <- getFileName(directory, i)
		temp <- read.csv(file)
		
		data <- rbind(data, temp)
		#temp <- data[, pollutant][!is.na(data[, pollutant])]
		result <- mean(data[, pollutant], na.rm = TRUE)
		index <- index+1
	}

	result
}

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