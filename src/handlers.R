# #########################################################
#               Command and Message Handlers
# #########################################################

start_handler <- CommandHandler('start', start)

offer_way_to_operate_handler <- MessageHandler(offer_way_to_operate, MessageFilters$wait_for_operating_way)
enter_operating_way_handler <- MessageHandler(enter_way_to_operate, MessageFilters$enter_operating_way)

upload_file_handler <- MessageHandler(upload_file, MessageFilters$upload_file_filter)
download_file_handler <- MessageHandler(download_file, MessageFilters$download_file_filter)
remove_file_handler <- MessageHandler(remove_file, MessageFilters$remove_file_filter)
