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

drive_upload("resources/txt_test_file.txt",
             "gdrive_fms_bot_data/txt_test_file.txt")
drive_upload("resources/docx_test_file.docx",
             "gdrive_fms_bot_data/docx_test_file.docx")
drive_upload("resources/pdf_test_file.pdf",
             "gdrive_fms_bot_data/pdf_test_file.pdf")

drive_ls("gdrive_fms_bot_data/")
drive_browse("gdrive_fms_bot_data/pdf_test_file.pdf")


prefix <- "gdrive_fms_bot_data/"
for (local_file_name in drive_ls(prefix)[[1]]) {
    full_file_name <- paste0(prefix, local_file_name)
    drive_rm(full_file_name)
}

