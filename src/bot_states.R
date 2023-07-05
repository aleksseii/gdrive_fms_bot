# #########################################################
#                       Bot States
# #########################################################

STATES <- list(
    START = "start",
    WAIT_FOR_OPERATING_WAY = "waiting for the way to operate on files",
    ENTER_OPERATING_WAY = "user enters operation way",
    UPLOAD_FILE = "Upload File",
    DOWNLOAD_FILE = "Download File",
    REMOVE_FILE = "Remove File",
    WAIT_FOR_SENDING_FILE_TO_UPLOAD = "waiting for sending the file to upload",
    WAIT_FOR_ENTERING_FILE_NAME_TO_DOWNLOAD = "waiting for entering the file name to download",
    WAIT_FOR_ENTERING_FILE_NAME_TO_REMOVE = "waiting for entering the file name to remove"
)

state <- STATES$START

get_state <- function() {
    return(state)
}

set_state <- function(new_state) {
    state <<- new_state
}

reset_state <- function() {
    set_start_state()
}

set_start_state <- function() {
    set_state(STATES$START)
}

set_wait_operating_way_state <- function() {
    set_state(STATES$WAIT_FOR_OPERATING_WAY)
}

set_enter_operating_way_state <- function() {
    set_state(STATES$ENTER_OPERATING_WAY)
}

set_wait_for_sending_file_to_upload <- function() {
    set_state(STATES$WAIT_FOR_SENDING_FILE_TO_UPLOAD)
}

set_wait_for_entering_file_name_to_download <- function() {
    set_state(STATES$WAIT_FOR_ENTERING_FILE_NAME_TO_DOWNLOAD)
}

set_wait_for_entering_file_name_to_remove <- function() {
    set_state(STATES$WAIT_FOR_ENTERING_FILE_NAME_TO_REMOVE)
}

# set_wait_sending_file_state <- function() {
#     set_state(STATES$WAIT_FOR_SENDING_FILE)
# }
