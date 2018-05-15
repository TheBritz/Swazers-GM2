/// @description DebugRunAction_scr(action_map)
/// @param action_map

var map = argument0;
var script = map[?DEBUG_SCRIPT];
var args = map[? DEBUG_ARGS];
script_execute(script, args);
