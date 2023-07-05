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
DRIVE_PREFIX <- "gdrive_fms_bot_data/"
RESOURCES_PREFIX <- "resources/"

drive_auth()
2

# loading code from other modules
source('src/bot_methods.R')
source('src/message_filters.R')
source('src/handlers.R')

# adding handlers to the bot
updater <- updater +
    start_handler +
    offer_way_to_operate_handler +
    enter_operating_way_handler +
    upload_file_handler +
    download_file_handler +
    remove_file_handler +
    do_upload_file_handler +
    do_download_file_handler +
    do_remove_file_handler
    

# run the bot
updater$start_polling()

