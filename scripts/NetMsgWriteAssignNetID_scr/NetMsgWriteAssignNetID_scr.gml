/// @description NetMsgWriteAssignNetID_scr(localID, netID, buffer [optional])
/// @param localID
/// @param  netID
/// @param  buffer [optional]

var i = 0;
var localID = argument[i++];
var netID = argument[i++];
var buff = undefined;
if(argument_count > i)
{
  buff = argument[i];  
}

if(is_undefined(buff))
{
  buff = buffer_create(256, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_NET_ID_ASSIGN);
buffer_write(buff, buffer_u32, localID);
buffer_write(buff, buffer_u32, netID);

return buff; 
