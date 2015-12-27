# Read in the data
data <- read.fwf(file = url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"), 
                 widths = c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),
                 skip = 4)
# Form the header row
header <- read.fwf(file = url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"), 
                   widths = c(-1,4,-10,3,-1,4,-5,3,-1,4,-5,3,-1,4,-5,3,-1,4),
                   skip = 3, 
                   n = 1)
# Rename the column names with the header
names <- as.vector(unlist(header[1,]))
data <- setNames(data, names)

# Return the result
sum(data[,4])