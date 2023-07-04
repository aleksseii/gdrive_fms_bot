library(telegram.bot)
library(googledrive)
library(configr)
library(dplyr)

# reading config data
config <- read.config("creds/config.yml")
bot_token <- config$telegram$bot$token

# connecting to telegram bot
bot <- Bot(token = bot_token)
updates <- bot$getUpdates()

chat_id <- updates[[1]]$from_chat_id()
username <- updates[[1]]$message$chat$username

bot$send_message(chat_id,
                 text = paste0("Hello *", username, "*! I'm a _bot_!"),
                 parse_mode = "Markdown")

# connecting to Google Drive
drive_auth()
2

drive_upload("resources/test_file_1.txt",
             "gdrive_fms_bot_data_examples/test_file_1.txt")

drive_ls("gdrive_fms_bot_data_examples/")
drive_browse("gdrive_fms_bot_data_examples/test_file_1.txt")

drive_rm("gdrive_fms_bot_data_examples/test_file_1.txt")

