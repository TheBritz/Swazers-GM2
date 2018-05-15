/// @description LobbyServerGetClient_scr(gameName, clientUID)
/// @param gameName
/// @param  clientUID

var gameName = argument0;
var clientUID = argument1;

var gameGroup = gameGroups[?gameName];

if(!is_undefined(gameGroup))
{
  var clients = gameGroup[?GAME_GROUP_CLIENTS];
  var client = clients[?clientUID];
  return undefined;
}
else
{
  return undefined;
}
