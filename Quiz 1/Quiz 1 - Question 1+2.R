library(data.table)

if (!file.exists("data")) {
        dir.create("data")
}

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(URL, destfile = "./data/housing.csv", method="curl")
dateDownloaded <- date()

housing <- read.csv("./data/housing.csv")
DT <- data.table(housing)

propertyValues <- DT[, .N, by=VAL]
propertyValues <- propertyValues[order(VAL)]