/// @description networkOutbox_obj init

//outboxMap stores all messages to be delivered
outboxMap = ds_map_create();

//recipient list is iterated through each end step event
//to send all messages in the outboxMap
recipientList = ds_list_create();


