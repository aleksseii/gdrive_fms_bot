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

MessageFilters$do_upload_file_filter <- BaseFilter(
    function(message) {
        get_state() == STATES$WAIT_FOR_SENDING_FILE_TO_UPLOAD
    }
)

MessageFilters$do_download_file_filter <- BaseFilter(
    function(message) {
        get_state() == STATES$WAIT_FOR_ENTERING_FILE_NAME_TO_DOWNLOAD
    }
)

MessageFilters$do_remove_file_filter <- BaseFilter(
    function(message) {
        get_state() == STATES$WAIT_FOR_ENTERING_FILE_NAME_TO_REMOVE
    }
)
