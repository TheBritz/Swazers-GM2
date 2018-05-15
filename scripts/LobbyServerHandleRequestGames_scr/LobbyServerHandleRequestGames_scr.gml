/// @description LobbyServerHandleRequestGames_scr(ip, buffer)
/// @param ip
/// @param  buffer

var ip = argument0;
var buff = argument1;
//buffer_seek(buff, buffer_seek_start, 0);
//var type = buffer_read(buff, buffer_u8);
//var gameName = buffer_read(buff, buffer_string);
var uid = buffer_read(buff, buffer_u32);
var gameName = gameNameByUID[?uid];
var clientMap = LobbyServerGetClientMap_scr(uid);
var port = clientMap[? CLIENT_PORT];
var gameGroup = gameGroups[? gameName];
var ownersList = gameGroup[? GAME_GROUP_SESSION_OWNERS];
var gameListMap = gameGroup[? GAME_GROUP_GAMES_MAP];

for(var i = 0; i < ds_list_size(ownersList); i++)
{
  var uid = ownersList[|i];
  var gameData = gameListMap[?uid];
  if(!is_undefined(gameData))
  {
    var dataStr = ds_map_write(gameData);
    
    var buffOut = buffer_create(256, buffer_grow, 1);
    buffer_write(buffOut, buffer_u8, MESSAGE_GAME_DATA);
    buffer_write(buffOut, buffer_string, dataStr);
    network_send_udp(socket, ip, port, buffOut, buffer_tell(buffOut));
    buffer_delete(buffOut);
  }
  else
  {
    //Run cleanup on ownersList
  }
}
