library(XML)

# Make the connection
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")

# Read the html code
htmlCode = readLines(con)

# Close the connection
close(con)

# Return the result
result <- c(nchar(htmlCode[10]),nchar(htmlCode[20]), nchar(htmlCode[30]),
            nchar(htmlCode[100]))
result