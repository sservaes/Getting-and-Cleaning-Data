library(xlsx)

if(!file.exists("data")) {
        file.create("data")
}

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(URL, "./data/Gas.xlsx", method="curl")
dateDownloaded <- date()

dat <- read.xlsx("./data/Gas.xlsx", sheetIndex = 1, startRow = 18, endRow = 23,colIndex = 7:15, header =  TRUE)
sum(dat$Zip*dat$Ext,na.rm=T)