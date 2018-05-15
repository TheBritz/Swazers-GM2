/// @description NetMsgWriteEnvironmentPregenData_scr(environmentInstanceNumber, buffer [optional])
/// @param environmentInstanceNumber
/// @param  buffer [optional]

var i = 0;
var envInstanceNumber = argument[i++];

var buff = undefined;
if(argument_count > i)
{
  buff = argument[i];  
}

if(is_undefined(buff))
{
  buff = buffer_create(40, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_ENV_PREGEN_DATA);
buffer_write(buff, buffer_u32, envInstanceNumber);

return buff; 
