/// @description ClientLobbyHandleGameData_scr(buffer)
/// @param buffer

var buff = argument0;

var gameDataStr = buffer_read(buff, buffer_string);
var gameData = ds_map_create();
ds_map_read(gameData, gameDataStr);
var gameName = gameData[? GAME_SESSION_NAME];

var btn = instance_create(window_get_width()/2, testButtonY, uiButtonJoinGame_obj);
btn.text = gameName;
btn.my_args[0] = global.LobbyIP;
btn.my_args[1] = serverPort;
btn.my_args[2] = gameData[? GAME_SESSION_NAME];
btn.my_args[3] = uid;
btn.my_args[4] = gameData[? GAME_SESSION_HOST_UID];
btn.my_args[5] = socket;
testButtonY += 30;
