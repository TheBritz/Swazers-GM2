/// @description LobbyServerAddClient_scr(gameName, clientIP, clientPort, clientPortSession, clientLocalIP) 
/// @param gameName
/// @param  clientIP
/// @param  clientPort
/// @param  clientPortSession
/// @param  clientLocalIP

var gameName = argument0;

var gameGroup;
if(!ds_map_exists(gameGroups, gameName))
{
  gameGroup = LobbyServerCreateGameGroup_scr(gameName);
  ds_map_add(gameGroups, gameName, gameGroup);
}
else
{
  gameGroup = gameGroups[?gameName];
}

var clientMap = ds_map_create();
var ip = argument1;
ds_map_add(clientMap, CLIENT_IP, ip);
ds_map_add(clientMap, CLIENT_PORT, argument2);
ds_map_add(clientMap, CLIENT_PORT_SESSION, argument3);
ds_map_add(clientMap, CLIENT_IP_LOCAL, argument4);
ds_map_add(clientMap, CLIENT_UID, ++UID);
ds_map_add(gameGroup[?GAME_GROUP_CLIENTS], UID, clientMap);
ds_map_add(clientUIDMap, ip + "|" + string(argument2), UID);
ds_map_add(gameGroup[?GAME_GROUP_UID], ip, UID);
ds_map_add(gameNameByUID, UID, gameName);
return UID;
