# #########################################################
#               Command and Message Handlers
# #########################################################

start_handler <- CommandHandler('start', start)

operate_handler <- MessageHandler(offer_way_to_operate, MessageFilters$wait_for_operating_way)
