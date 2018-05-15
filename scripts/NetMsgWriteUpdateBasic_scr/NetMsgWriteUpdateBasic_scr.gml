/// @description NetMsgWriteUpdateBasic_scr(recipient, updateMap, buffer [optional])
/// @param recipient
/// @param  updateMap
/// @param  buffer [optional]

var recipient = argument[0];
var updateMap = argument[1];

var updateStr = ds_map_write(updateMap);

var buff = undefined;
if(argument_count > 2)
{
  buff = argument[2];  
}

if(is_undefined(buff))
{
  buff = buffer_create(256, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_UPDATE_BASIC);
buffer_write(buff, buffer_u32, recipient);
buffer_write(buff, buffer_string, updateStr);

return buff; 
