/// @description LobbyServerRegisterSubclient_scr(gameName, uid, ip, port)
/// @param gameName
/// @param  uid
/// @param  ip
/// @param  port

var uid = argument0;
var ip = argument1;
var port = argument2;

var clientData = LobbyServerGetClientMap_scr(uid);
clientData[?CLIENT_IP_SESSION] = ip;
clientData[?CLIENT_PORT_SESSION] = port;
var test = "test";
ds_map_replace(clientData, CLIENT_PORT_SESSION, port);
test = "test";
