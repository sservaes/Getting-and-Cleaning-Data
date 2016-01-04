URL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
URL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
        
# Download the data
download.file(URL1, './data/GDP.csv')
download.file(URL2, './data/education.csv')
dateDownloaded <- date()

# Read in the data
columnNames <- c("CountryCode", "ranking", "", "economy", "millionsofUSdollars", "", "", "", "", "")
GDP <- read.csv("./data/GDP.csv", skip = 4, col.names = columnNames, nrows = 190)
education <- read.csv("./data/education.csv")

# Merge the 2 datasets according to CountryCode
dt <- merge(GDP, education, by = "CountryCode")

# Get the amount of countries that have their fiscal year ended in June
length(grep("^Fiscal year end: June", dt$Special.Notes))