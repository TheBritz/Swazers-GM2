/// @description NetMsgLobbyClientSendCreateGame_scr(argArray)
/// @param argArray

var argArray = argument0;
var uid = argArray[0];
var serverIP = argArray[1];
var svrPort = argArray[2];
var svrSocket = argArray[3];

var buff = buffer_create(40, buffer_fixed, 1);

buffer_write(buff, buffer_u8, MESSAGE_CREATE_GAME);
buffer_write(buff, buffer_u32, uid);

network_send_udp(svrSocket, serverIP, svrPort, buff, buffer_tell(buff));

buffer_delete(buff);
