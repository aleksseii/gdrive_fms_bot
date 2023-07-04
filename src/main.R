library(telegram.bot)
library(googledrive)
library(configr)
library(dplyr)

# reading config data
config <- read.config("creds/config.yml")
bot_token <- config$telegram$bot$token

# connecting to telegram bot
updater <- Updater(token = bot_token)

# connecting to Google Drive
drive_auth() 
2


# run the bot
updater$start_polling()
