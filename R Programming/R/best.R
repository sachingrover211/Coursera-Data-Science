best <- function(state, outcome){
	##Read outcome data
	data <- read.csv("../data/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")

	##check that state and outcome are valid
	stateFactors <- factor(data$State)
	if(length(grep(state, levels(stateFactors)))== 0){
		stop("invalid state")
	}

	outcomes <- c("heart attack", "pneumonia", "heart failure")
	outcome_regex <- paste("^", outcome, "$", sep = "")
	index <- grep(outcome_regex, outcomes, ignore.case = TRUE)

	if(length(index) == 0){
		stop("invalid outcome")
	}

	##Return hospital name in that state with lowest 30-day death rate
	cols<-c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure");
	col_name <- cols[index]
	
	state_data <- data[data$State == state & (data[, col_name] != "Not Available"), ]
	return(as.character(state_data[which.min(as.numeric(state_data[, col_name])), "Hospital.Name"]))
}
