# #########################################################
#                   Message State Filters
# #########################################################

MessageFilters$wait_for_operating_way <- BaseFilter(
    function(message) {
        get_state() == STATES$WAIT_FOR_OPERATING_WAY
    }
)

MessageFilters$enter_operating_way <- BaseFilter(
    function(message) {
        get_state() == STATES$ENTER_OPERATING_WAY
    }
)

MessageFilters$upload_file_filter <- BaseFilter(
    function(message) {
        get_state() == STATES$UPLOAD_FILE
    }
)

MessageFilters$download_file_filter <- BaseFilter(
    function(message) {
        get_state() == STATES$DOWNLOAD_FILE
    }
)

MessageFilters$remove_file_filter <- BaseFilter(
    function(message) {
        get_state() == STATES$REMOVE_FILE
    }
)

# MessageFilters$wait_for_sending_file <- BaseFilter(
#     function(message) {
#         get_state() == "waiting for sending the file"
#     }
# )
# 
# MessageFilters$wait_for_entering_file_name <- BaseFilter(
#     function(message) {
#         get_state() == "waiting for entering the file name"
#     }
# )
