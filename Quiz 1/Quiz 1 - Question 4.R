library(XML)

URL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(URL, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
DT <- as.data.frame(table(zipcode))