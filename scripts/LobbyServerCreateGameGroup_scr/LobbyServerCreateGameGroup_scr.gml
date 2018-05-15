/// @description LobbyServerCreateGameGroup_scr()

var gameGroup = ds_map_create();
var cMap = ds_map_create();
var uidMap = ds_map_create();
var gameOwnersList = ds_list_create(); //List of uid's that own game sessions
var gameListMap = ds_map_create(); //List of game session data stored against uid's

ds_map_add(gameGroup, GAME_GROUP_CLIENTS, cMap);
ds_map_add(gameGroup, GAME_GROUP_UID, uidMap);
ds_map_add(gameGroup, GAME_GROUP_SESSION_OWNERS, gameOwnersList);
ds_map_add(gameGroup, GAME_GROUP_GAMES_MAP, gameListMap);

return gameGroup;

