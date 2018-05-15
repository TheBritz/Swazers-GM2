/// @description NetMsgWriteWelcome_scr(serverPort, uniqueID, buffer [optional])
/// @param serverPort
/// @param  uniqueID
/// @param  buffer [optional]

var _port = argument[0];
var _uid = argument[1];

var buff = undefined;
if(argument_count > 2)
{
  buff = argument[2];  
}

if(is_undefined(buff))
{
  buff = buffer_create(256, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_WELCOME);
buffer_write(buff, buffer_u16, _port);
buffer_write(buff, buffer_u32, _uid);

return buff;
