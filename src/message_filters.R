# #########################################################
#                   Message State Filters
# #########################################################

MessageFilters$wait_for_operating_way <- BaseFilter(
    function(message) {
        get_state() == "waiting for the way to operate on files"
    }
)

MessageFilters$wait_for_sending_file <- BaseFilter(
    function(message) {
        get_state() == "waiting for sending the file"
    }
)

MessageFilters$wait_for_entering_file_name <- BaseFilter(
    function(message) {
        get_state() == "waiting for entering the file name"
    }
)
