library(httr)
library(jsonlite)

# Find OAuth settings for github
oauth_endpoints("github")

# Store key and secret
myapp <- oauth_app("github", 
        key = "49b9b3c6e0adb457c0d5", 
        secret = "a93ec5df5e5e2377c29c011f7b0b89649efabfb9")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache = FALSE)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1 <- content(req)
json2 <- fromJSON(toJSON(json1))

# Return result
result <- json2[,c("name", "created_at")]
result[which(result == "datasharing"),]