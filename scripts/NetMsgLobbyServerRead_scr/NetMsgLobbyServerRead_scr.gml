/// @description NetMsgLobbyServerRead_scr(type, ip, port, buffer)
/// @param type
/// @param  ip
/// @param  port
/// @param  buffer

var type = argument0;
var ip = argument1;
var port = argument2;
var buff = argument3;

switch(type)
{
  case MESSAGE_HELLO:
    LobbyServerHandleHello_scr(ip, port, buff);
  break;
  
  case MESSAGE_CREATE_GAME:
    LobbyServerHandleCreateGame_scr(buff);    
  break;
 
  case MESSAGE_REQUEST_GAMES:
    LobbyServerHandleRequestGames_scr(ip, buff);
  break;
  
  case MESSAGE_REQUEST_JOIN:
    LobbyServerHandleRequestJoin_scr(ip, buff);
  break;
  
  case MESSAGE_REGISTER_SUBCLIENT:
    LobbyServerHandleRegisterSubclient_scr(ip, port, buff);
  break;
  
  case MESSAGE_CONNECT_SESSION_PEERS:
    LobbyServerHandleConnectSessionPeers_scr(buff);
  break;
}
