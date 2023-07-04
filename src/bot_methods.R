# bot behavior on `start` command
start <- function(bot, update) {
    text <- "Choose command:"
    
    reply_keyboard <- ReplyKeyboardMarkup(
        keyboard = list(
            list(KeyboardButton("Operate On Files")),
            list(KeyboardButton("Get Statistics"))
        ),
        resize_keyboard = TRUE,
        one_time_keyboard = TRUE
    )
    
    bot$sendMessage(chat_id = update$message$chat_id,
                    text = text,
                    reply_markup = reply_keyboard)
}
