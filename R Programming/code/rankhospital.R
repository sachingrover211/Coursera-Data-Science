rankhospital <- function(state, outcome, num="best"){
	## Read outcome data
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
	
	cols<-c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure");
	col_name <- cols[index]
	
	state_data <- data[(data$State == state & (data[, col_name]) != "Not Available"), ]
	if(num == "best"){
		num = 1
	
	} else if(num == "worst") {
		num = nrow(state_data)
	}
	
	if(num > nrow(state_data)){
		return(NA)
	}
	
	ordered_state_data <- state_data[order(as.numeric(state_data[,col_name]), state_data[,"Hospital.Name"]), ]
	return(as.character(ordered_state_data[num, "Hospital.Name"]))
}
