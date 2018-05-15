/// @description NetMsgWriteScriptExecute_scr(scriptIndex, args)
/// @param scriptIndex
/// @param  args

var i = 0;
var scriptIndex = argument[i++];
var args = argument[i++];
var buff = undefined;
if(argument_count > i)
{
  buff = argument[i];  
}

if(is_undefined(buff))
{
  buff = buffer_create(128, buffer_grow, 1);
}

var scriptName = script_get_name(scriptIndex);
var argsStr = ds_list_write(args);

buffer_write(buff, buffer_u8, MESSAGE_EXECUTE_SCRIPT);
buffer_write(buff, buffer_string, scriptName);
buffer_write(buff, buffer_string, argsStr);

return buff; 
