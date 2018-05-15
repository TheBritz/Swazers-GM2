/// @description DebugRegisterAction_scr(button, buttonPressType, actionScript, actionDesc, [optional] actionArgs)
/// @param button
/// @param  buttonPressType
/// @param  actionScript
/// @param  actionDesc
/// @param  [optional] actionArgs

var i = 0;
var button = argument[i++];
var pressType = argument[i++];
var actionScript = argument[i++];
var actionDesc = argument[i++];
var actionArgs = undefined;
if(argument_count > i)
{
  actionArgs = argument[i++]; 
}

var map = ds_map_create();
ds_map_add(map, DEBUG_SCRIPT, actionScript);
ds_map_add(map, DEBUG_DESCRIPTION, actionDesc);
ds_map_add(map, DEBUG_PRESS_TYPE, pressType);
ds_map_add(map, DEBUG_ARGS, actionArgs);
ds_map_add(debugActions, button, map);
