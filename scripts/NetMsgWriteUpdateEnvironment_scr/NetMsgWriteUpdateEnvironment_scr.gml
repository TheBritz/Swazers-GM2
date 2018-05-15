/// @description NetMsgWriteUpdateEnvironment_scr(updateNumber, environmentObjectInstance, buffer [optional])
/// @param updateNumber
/// @param  environmentObjectInstance
/// @param  buffer [optional]

var i = 0;
var updateNumber = argument[i++];
var envObjInstance = argument[i++];

var buff = undefined;
if(argument_count > i)
{
  buff = argument[i];  
}

if(is_undefined(buff))
{
  buff = buffer_create(256, buffer_grow, 1);
}

with(envObjInstance)
{
  buffer_write(buff, buffer_u8, MESSAGE_UPDATE_ENVIRONMENT);
  buffer_write(buff, buffer_u32, updateNumber);
  buffer_write(buff, buffer_string, object_get_name(object_index));
  buffer_write(buff, buffer_u32, x); 
  buffer_write(buff, buffer_u32, y);
  buffer_write(buff, buffer_u16, image_angle);
  buffer_write(buff, buffer_u32, image_xscale);
  buffer_write(buff, buffer_u32, image_yscale);  
}

return buff; 
