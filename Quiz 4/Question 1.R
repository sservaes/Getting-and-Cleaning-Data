URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(URL, './data/housing.csv')
dateDownloaded <- date()

housing <- read.csv("./data/housing.csv")
splitNames <- strsplit(names(housing), "wgtp")
splitNames[123]