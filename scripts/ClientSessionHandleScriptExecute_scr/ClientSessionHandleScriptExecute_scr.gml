/// @description ClientSessionHandleScriptExecute_scr(buff)
/// @param buff

var buff = argument0;

//Get script
var scriptName = buffer_read(buff, buffer_string);
var script = asset_get_index(scriptName);

//Get args
var argsStr = buffer_read(buff, buffer_string);
var args = ds_list_create();
ds_list_read(args, argsStr);

//Execute Script
script_execute(script, args);

//Delete args list
ds_list_destroy(args);
