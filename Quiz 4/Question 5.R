library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

rowNames <- row.names(data.matrix(amzn))
selection <- grep("^2012", rowNames)
length(selection)

rowNames <- as.Date(rowNames)
selectedDates <- rowNames[selection]

length(grep("maandag", weekdays(selectedDates)))