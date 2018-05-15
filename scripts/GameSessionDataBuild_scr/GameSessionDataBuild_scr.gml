/// @description GameSessionDataBuild_scr(gameName, joinPolicy)
/// @param gameName
/// @param  joinPolicy

var map = ds_map_create();

map[?GAME_SESSION_NAME] = argument0;
map[?GAME_SESSION_JOIN_POLICY] = argument1;

return map;
