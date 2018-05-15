/// @description NetMsgWriteResponse_scr(type, buffer [optional])
/// @param type
/// @param  buffer [optional]

var i = 0;
var type = argument[i++];

var buff = undefined;
if(argument_count > i)
{
  buff = argument[i];  
}

if(is_undefined(buff))
{
  buff = buffer_create(16, buffer_fixed, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_RESPONSE);
buffer_write(buff, buffer_u8, type);

return buff;
