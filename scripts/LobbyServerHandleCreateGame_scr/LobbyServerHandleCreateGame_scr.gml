/// @description LobbyServerHandleCreateGame_scr(buffer)
/// @param buffer

var buff = argument0;

var uid = buffer_read(buff, buffer_u32);

//Get the game this uid is registered for
var gameName = gameNameByUID[?uid];

//Get the game session data
var dataStr = buffer_read(buff, buffer_string);
var data = ds_map_create();
ds_map_read(data, dataStr);

//Get the game group from the game groups 
//map using the game name
var gameGroup = gameGroups[? gameName];

//Add this value to the session owners list
var gameOwners = gameGroup[? GAME_GROUP_SESSION_OWNERS];

//Get the games list from the game group
//map
var gamesListMap = gameGroup[? GAME_GROUP_GAMES_MAP];

//Add this owner (if it doesn't already exist)
if(ds_list_find_index(gameOwners, uid) == -1)
{
  ds_list_add(gameOwners, uid);
}

//Add the host uid to the game data
data[? GAME_SESSION_HOST_UID] = uid;

//Add new players list to session data - add 
//the game creator to the players list
data[? GAME_SESSION_PLAYERS_LIST] = ds_list_create();
ds_list_add(data[? GAME_SESSION_PLAYERS_LIST], uid);

//add game data to the list
gamesListMap[? uid] = data;

