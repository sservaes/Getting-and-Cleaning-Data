URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "

# Download the data
download.file(URL, './data/GDP.csv')
dateDownloaded <- date()

# Read in the data
columnNames <- c("country", "ranking", "", "economy", "millionsofUSdollars", "", "", "", "", "")
GDP <- read.csv("./data/GDP.csv", skip = 4, col.names = columnNames, nrows = 190)

# Remove the commas in millionsofUSdollars
GDP$millionsofUSdollars <- gsub(",", "", GDP$millionsofUSdollars)
GDP$millionsofUSdollars <- as.numeric(GDP$millionsofUSdollars)

# Calculate the average
mean(GDP$millionsofUSdollars)