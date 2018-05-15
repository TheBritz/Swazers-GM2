/// @description NetMsgLobbyClientRead_scr(type, ip, buffer)
/// @param type
/// @param  ip
/// @param  buffer

var type = argument0;
var ip = argument1;
var port = argument2;
var buff = argument3;

switch(type)
{
  case MESSAGE_WELCOME:
    ClientLobbyHandleWelcome_scr(buff);
  break;
  
  case MESSAGE_GAME_DATA:
    ClientLobbyHandleGameData_scr(buff);
  break;
  
  case MESSAGE_JOIN_RESPONSE:
    ClientLobbyHandleJoinResponse_scr(buff);
  break;
  
  case MESSAGE_PLAYER_DATA:
    ClientLobbyHandlePlayerData_scr(buff);
  break;
  
  case MESSAGE_SEND_HOLEPUNCH_TO:
    ClientLobbyHandleSendHolepunchTo_scr(buff);
  break;
}

