# #########################################################
#                       Bot Methods
# #########################################################

source('src/bot_states.R')

FILE_OPERATIONS <- list(
    UPLOAD = "Upload File",
    DOWNLOAD = "Download File",
    REMOVE = "Remove File"
)


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
    
    bot$sendMessage(chat_id = update$from_chat_id(),
                    text = choose_command_text,
                    reply_markup = reply_keyboard)
    
    set_wait_operating_way_state()
}

# bot behavior offering ways to operate on files
offer_way_to_operate <- function(bot, update) {
    
    operation_on_file_text <- "What do you want to do with the file?"
    
    reply_keyboard <- ReplyKeyboardMarkup(
        keyboard = list(
            list(KeyboardButton(FILE_OPERATIONS$UPLOAD)),
            list(KeyboardButton(FILE_OPERATIONS$DOWNLOAD)),
            list(KeyboardButton(FILE_OPERATIONS$REMOVE))
        ),
        resize_keyboard = TRUE,
        one_time_keyboard = TRUE
    )
    
    bot$sendMessage(chat_id = update$from_chat_id(),
                    text = operation_on_file_text,
                    reply_markup = reply_keyboard)
    
    set_wait_operating_way_state()
}

# bot behavior while operating on files
enter_way_to_operate <- function(bot, update) {
    
    operation <- update$message$text
    
    if (operation == FILE_OPERATIONS$UPLOAD) {
        print("User should upload file here")
    } else if (operation == FILE_OPERATIONS$DOWNLOAD) {
        print("User should name a file to download here")
    } else if (operation == FILE_OPERATIONS$REMOVE) {
        print("User should name a file to remove here")
    } else {
        print("Wrong operation")
    }
    
    set_wait_operating_way_state()
}

# bot behavior on `upload_file` command
upload_file <- function(bot, update) {
    
    send_file_text <- "Send a file that you want to be uploaded on Google Drive:"
    
    bot$sendMessage(chat_id = update$from_chat_id(),
                    text = send_file_text)
}
