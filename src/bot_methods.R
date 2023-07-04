# bot behavior on `start` command
start <- function(bot, update) {
    
    choose_command_text <- "Choose command:"
    
    reply_keyboard <- ReplyKeyboardMarkup(
        keyboard = list(
            list(KeyboardButton("Operate On Files")),
            list(KeyboardButton("Get Statistics"))
        ),
        resize_keyboard = TRUE,
        one_time_keyboard = TRUE
    )
    
    bot$sendMessage(chat_id = update$from_chat_id,
                    text = choose_command_text,
                    reply_markup = reply_keyboard)
}

# bot behavior on `operate_on_files` command
operate_on_files <- function(bot, update) {
    
    operation_on_file_text <- "What do you want to do with the file?"
    
    reply_keyboard <- ReplyKeyboardMarkup(
        keyboard = list(
            list(KeyboardButton("Upload File")),
            list(KeyboardButton("Donwload File")),
            list(KeyboardButton("Remove File"))
        ),
        resize_keyboard = TRUE,
        one_time_keyboard = TRUE
    )
    
    bot$sendMessage(chat_id = update$from_chat_id,
                    text = operation_on_file_text,
                    reply_markup = reply_keyboard)
}

# bot behavior on `upload_file` command
upload_file <- function(bot, update) {
    
    send_file_text <- "Send a file that you want to be uploaded on Google Drive:"
    
    bot$sendMessage(chat_id = update$from_chat_id,
                    text = send_file_text)
    
}