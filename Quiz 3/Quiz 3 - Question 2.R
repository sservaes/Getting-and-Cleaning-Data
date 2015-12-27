library(jpeg)

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(URL, "./data/myImage.jpg", method="curl", mode = "wb")
dateDownloaded <- date()

myImage <- readJPEG("./data/myImage.jpg", native = TRUE)

quantile(myImage, probs = c(0.3, 0.8))