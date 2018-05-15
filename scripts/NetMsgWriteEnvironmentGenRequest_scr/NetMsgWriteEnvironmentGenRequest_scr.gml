/// @description NetMsgWriteEnvironmentGenRequest_scr(clientUID, buffer [optional])
/// @param clientUID
/// @param  buffer [optional]

var i = 0;
var clientUID = argument[i++];

var buff = undefined;
if(argument_count > i)
{
  buff = argument[i];  
}

if(is_undefined(buff))
{
  buff = buffer_create(40, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_ENV_GEN_REQUEST);
buffer_write(buff, buffer_u32, clientUID);

return buff; 
