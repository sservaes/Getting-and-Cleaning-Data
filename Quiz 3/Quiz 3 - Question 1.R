library(data.table)

if (!file.exists("data")) {
        dir.create("data")
}

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(URL, "./data/housing.csv", method="curl")
dateDownloaded <- date()

housing <- read.csv("./data/housing.csv")

agricultureLogical <- (housing$ACR == 3 & housing$AGS == 6)
which(agricultureLogical)