library(plyr)
library(dplyr)

URL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
URL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv "
download.file(URL1, "./data/GDP.csv", method="curl")
download.file(URL2, "./data/Education.csv", method="curl")
dateDownloaded <- date()

GDP <- read.csv("./data/GDP.csv", skip = 4, nrows = 215)
EDU <- read.csv("./data/Education.csv")
setnames(GDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))

merged <- join(GDP, EDU, by = "CountryCode")
sum(!is.na(unique(merged$rankingGDP)))

mergedArr <- arrange(merged, desc(rankingGDP))
mergedArr$Long.Name[13]

income <- tapply(mergedArr$rankingGDP, mergedArr$Income.Group, mean, na.rm = TRUE)
as.data.frame(income)

breaks <- quantile(mergedArr$rankingGDP, probs = seq(0, 1, 0.2), na.rm = TRUE)
mergedArr$quantileGDP <- cut(mergedArr$rankingGDP, breaks = breaks)
dt <- mergedArr[mergedArr$Income.Group == "Lower middle income",]
count(dt, 'quantileGDP')