/// @description LobbyServerGetClientMap_scr(uid)
/// @param uid

var uid = argument0;
var gameGroup = gameGroups[?gameNameByUID[?uid]];
var clientsMap = gameGroup[?GAME_GROUP_CLIENTS];
return clientsMap[?uid];

