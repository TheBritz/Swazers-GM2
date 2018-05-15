/// @description Lobby Client Init
event_inherited();

global.ClientLobby = id;

testButtonY = 100;

buffer = buffer_create(256, buffer_grow, 1);

inLobby = false;

hello_alarm_ind = 0;
hello_ping_rate = room_speed/4;
socket = -1;
clientPort = undefined;
serverPort = undefined;
uid = undefined;
dialogID = undefined;
dialogJoinID = undefined;
readScript = NetMsgLobbyClientRead_scr;

var sockArr = SocketEstablish_scr();
socket = sockArr[0];
clientPort = sockArr[1];

sockArr = SocketEstablish_scr();
sessionSocket = sockArr[0];
sessionPort = sockArr[1];
show_message_async("Session client is running on port: " + string(sessionPort));

alarm[hello_alarm_ind] = hello_ping_rate;

helloBuffer = NetMsgWriteHello_scr(GAME_NAME, clientPort, sessionPort, global.LocalIP, buffer);


