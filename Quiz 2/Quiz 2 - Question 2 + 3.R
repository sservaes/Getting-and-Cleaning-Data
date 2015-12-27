library(sqldf)

acs <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv ")

# Question 2
head(sqldf("select pwgtp1 from acs where AGEP < 50"))

# Question 3
head(sqldf("select distinct pwgtp1 from acs"))