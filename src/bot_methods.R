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
    
    set_enter_operating_way_state()
}

# here user enters way to operate the file
enter_way_to_operate <- function(bot, update){
    
    operation <- update$message$text
    set_state(operation)
}

# bot behavior in case user wants to upload new file
upload_file <- function(bot, update) {
    
    bot$sendMessage(chat_id = update$from_chat_id(),
                    text = "Upload file that you want to be *stored* to Google Drive",
                    parse_mod = "Markdown")
    set_wait_for_sending_file_to_upload()
}

# bot behavior in case user wants to download existing file
download_file <- function(bot, update) {
    
    bot$sendMessage(chat_id = update$from_chat_id(),
                    text = "Enter name of the file that you want to *download* from Google Drive",
                    parse_mod = "Markdown")
    set_wait_for_entering_file_name_to_download()
}

# bot behavior in case user wants to remove existing file from Google Drive
remove_file <- function(bot, update) {
    
    bot$sendMessage(chat_id = update$from_chat_id(),
                    text = "Enter name of the file that you want to *remove* from Google Drive",
                    parse_mod = "Markdown")
    set_wait_for_entering_file_name_to_remove()
}

# actually uploading file
do_upload <- function(bot, update) {
    document <- update$message$document
    if (is.null(document)) {
        bot$sendMessage(chat_id = update$from_chat_id(),
                        text = "You should have been upload a file, try again")
        set_start_state()
        return()
    }
    
    file_id <- document$file_id
    file_name <- document$file_name
    
    local_file_path <- paste0(RESOURCES_PREFIX, file_name)
    bot$getFile(file_id, local_file_path)
    
    drive_file_path <- paste0(DRIVE_PREFIX, file_name)
    drive_upload(local_file_path, drive_file_path)
    
    bot$sendMessage(chat_id = update$from_chat_id(),
                    text = paste0("Successfully uploaded file named *", file_name, "*"),
                    parse_mode = "Markdown")
    set_start_state()
}

# actually downloading file
do_download <- function(bot, update) {
    
    file_name <- update$message$text
    all_file_names <- drive_ls(DRIVE_PREFIX)[[1]]
    
    local_file_path <- paste0(RESOURCES_PREFIX, file_name)
    drive_file_path <- paste0(DRIVE_PREFIX, file_name)
    
    if (!(file_name %in% list.files(RESOURCES_PREFIX))) {
        drive_download(drive_file_path, local_file_path)
    }
    
    bot$sendDocument(
        chat_id = update$from_chat_id(),
        document = local_file_path,
        filename = file_name
    )
    set_start_state()
}

# actually removing file
do_remove <- function(bot, update) {
    
    file_name <- update$message$text
    
    local_file_path <- paste0(RESOURCES_PREFIX, file_name)
    drive_file_path <- paste0(DRIVE_PREFIX, file_name)
    
    if (file_name %in% list.files(RESOURCES_PREFIX)) {
        
        file.remove(local_file_path)
        drive_rm(drive_file_path)
        
        bot$sendMessage(chat_id = update$from_chat_id(),
                        text = paste0("Successfully removed file named *", file_name, "*"),
                        parse_mode = "Markdown")
        set_start_state()
        return()
    }
    
    bot$sendMessage(chat_id = update$from_chat_id(),
                    text = paste0("Not found file with name *", file_name, "*"),
                    parse_mode = "Markdown")
    set_start_state()
}
