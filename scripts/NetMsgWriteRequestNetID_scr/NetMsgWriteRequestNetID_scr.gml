/// @description NetMsgWriteRequestNetID_scr(uid, localID, buffer [optional])
/// @param uid
/// @param  localID
/// @param  buffer [optional]

var i = 0;
var uid = argument[i++];
var localID = argument[i++];
var buff = undefined;
if(argument_count > i)
{
  buff = argument[i];  
}

if(is_undefined(buff))
{
  buff = buffer_create(256, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_NET_ID_REQUEST);
buffer_write(buff, buffer_u32, uid);
buffer_write(buff, buffer_u32, localID);

return buff; 
