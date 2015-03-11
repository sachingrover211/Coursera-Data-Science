source("rankhospital.R")
rankall <- function(outcome, num = "best"){
	## Read outcome data
	data <- read.csv("../data/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv");
	
	##outcomes <- c("heart attack", "pneumonia", "hear failure")
	##index <- grep(outcome, outcomes, ignore.case = TRUE)

	##if(!(index > 0)){
	##	stop("invalid outcome")
	##}
	
	state <- levels(factor(data$State))
	hospital <- vector()

	for(i in 1:length(state)){
		hospital[i] <- rankhospital(state[i], outcome, num)
	}
	
	return(data.frame(hospital, state))
}
