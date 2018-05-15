/// @description NetMsgWriteHolePunchResponse_scr(uid, buffer [optional])
/// @param uid
/// @param  buffer [optional]

var i = 0;
var uid = argument[i++];

var buff = undefined;
if(argument_count > i)
{
  buff = argument[i];  
}

if(is_undefined(buff))
{
  buff = buffer_create(40, buffer_grow, 4);
}

var scriptName = script_get_name(scriptIndex);
var argsStr = ds_list_write(args);

buffer_write(buff, buffer_u8, MESSAGE_HOLEPUNCH_RESPONSE);
buffer_write(buff, buffer_u32, uid);

return buff; 
