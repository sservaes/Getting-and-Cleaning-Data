library(data.table)

if (!file.exists("data")) {
        dir.create("data")
}

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(URL, destfile = "./data/housing2.csv", method="curl")
dateDownloaded <- date()

DT <- fread("./data/housing2.csv")