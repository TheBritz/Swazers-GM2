/// @description NetMsgWriteSessionDisconnect_scr(uid)
/// @param uid

var i = 0;
var _uid = argument[i++];
var buff = undefined;
if(argument_count > i)
{
  buff = argument[i];  
}

if(is_undefined(buff))
{
  buff = buffer_create(40, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_SESSION_DISCONNECT);
buffer_write(buff, buffer_u32, _uid);

return buff; 
