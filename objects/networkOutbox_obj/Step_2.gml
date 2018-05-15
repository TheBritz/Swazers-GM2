/// @description Send out all messages in the outbox
var recipient, message, messageStr;
for(var i = 0; i < ds_list_size(recipientList); i++)
{
  //Get the message map
  recipient = recipientList[|i]; 
  message = outboxMap[? recipient];
  //Serialize message map 
  
  messageStr = ds_map_write(message);
  
  //Send serialized message map to all other clients
}

