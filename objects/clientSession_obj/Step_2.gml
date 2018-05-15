/// @description Send out all messages in the outbox
testStepCounter++;
var recipient, message, messageStr;
for(var i = 0; i < ds_list_size(recipientList); i++)
{
  //Get the message map
  var recipient = recipientList[|i]; 
  var message = outboxMap[? recipient];
  
  //Fill the buffer
  buffer_seek(buffer, buffer_seek_start, 1);
  var buff = NetMsgWriteUpdateBasic_scr(recipient, message);
  
  //Send message map to all other clients
  var peerData, buff;
  for(var ii = 0; ii < ds_list_size(peerList); ii++)
  {
    peerData = peerList[|ii];
    
    //Send update message
    var buffTell = buffer_tell(buffer);
    var test = peerData[? CLIENT_IP];
    network_send_udp(socket, peerData[? CLIENT_IP], peerData[? CLIENT_PORT_SESSION],
      buff, buffer_tell(buff));  
    var buffTell = buffer_tell(buffer); 
  }
  
  buffer_delete(buff);
}
//Clear recipient list and outbox map
ds_list_clear(recipientList);
ds_map_clear(outboxMap);

