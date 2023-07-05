# #########################################################
#                   Main Application
# #########################################################

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

# loading code from other modules
source('src/bot_methods.R')
source('src/message_filters.R')
source('src/handlers.R')

# adding handlers to the bot
updater <- updater +
    start_handler +
    operate_handler
    

# run the bot
updater$start_polling()

