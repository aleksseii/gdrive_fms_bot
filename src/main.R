library(telegram.bot)
library(googledrive)
library(configr)
library(dplyr)

config <- read.config("creds/config.yml")
bot_token <- config$telegram$bot$token

bot <- Bot(token = bot_token)
updates <- bot$getUpdates()

chat_id <- updates[[1]]$from_chat_id()
username <- updates[[1]]$message$chat$username

bot$send_message(chat_id,
                 text = paste0("Hello *", username, "*! I'm a _bot_!"),
                 parse_mode = "Markdown")
