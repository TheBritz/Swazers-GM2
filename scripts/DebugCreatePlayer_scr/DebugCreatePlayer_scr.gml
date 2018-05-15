/// @description DebugCreatePlayer_scr(playerNumber [non-zero])
/// @param playerNumber [non-zero]
var index = string(argument0);
var objName = "player" + index + "Test_obj";
var objIndex = asset_get_index(objName);
instance_create(room_width/2, room_height/2, objIndex);
