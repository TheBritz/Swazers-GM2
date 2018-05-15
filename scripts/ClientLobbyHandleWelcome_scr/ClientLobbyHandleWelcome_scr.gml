/// @description ClientLobbyHandleWelcome_scr(buffer)
/// @param buffer
var buff = argument0;
serverPort = buffer_read(buff, buffer_u16);
uid = buffer_read(buff, buffer_u32);
inLobby = true;

//Send Game request
var buffSend = NetMsgWriteRequestGames_scr(GAME_NAME, uid, buffer);
network_send_udp(socket, global.LobbyIP, 
serverPort, buffSend, buffer_tell(buffSend));
buffer_delete(buffSend);

//Register the game client
var buffSend = NetMsgWriteRegisterSubclient_scr(uid);
network_send_udp(sessionSocket, global.LobbyIP, 
  serverPort, buffSend, buffer_tell(buffSend));
buffer_delete(buffSend);

//Test code for creating a game
if(instance_number(uiButtonCreateGame_obj) < 1)
{
  var btn = instance_create(x + 80, y, uiButtonCreateGame_obj);
  btn.my_args = id;

  btn = instance_create(x + 80, y + 80, uiButtonCreateGame_obj);
  btn.text = "Join Game";
  btn.my_args = id;
}

