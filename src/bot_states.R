# #########################################################
#                       Bot States
# #########################################################

STATES <- list(
    START = "start",
    WAIT_FOR_OPERATING_WAY = "waiting for the way to operate on files",
    WAIT_FOR_SENDING_FILE = "waiting for sending the file",
    WAIT_FOR_ENTERING_FILE_NAME = "waiting for entering the file name"
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

set_wait_sending_file_state <- function() {
    set_state(STATES$WAIT_FOR_SENDING_FILE)
}
