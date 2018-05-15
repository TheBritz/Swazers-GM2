/// @description GameSessionRequestJoin_scr(argArray)
/// @param argArray
var argArray = argument0;

var lobbyServerIP = argArray[0];
var lobbyServerPort = argArray[1];
var gameName = argArray[2];
var clientUID = argArray[3];
var hostUID = argArray[4];
var sock = argArray[5];

var buff = NetMsgWriteRequestJoin_scr(gameName, clientUID, hostUID, "");

network_send_udp(sock, lobbyServerIP, lobbyServerPort, buff, buffer_tell(buff));

buffer_delete(buff);
