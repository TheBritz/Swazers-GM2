/// @description LobbyServerHandleConnectSessionPeers_scr(buff)
/// @param buff
//var writeScript = NetMsgWriteRegisterSubclient_scr;

var buff = argument0;

var uidSend = buffer_read(buff, buffer_u32);
var uidReceive = buffer_read(buff, buffer_u32);

var clientSend = LobbyServerGetClientMap_scr(uidSend);
var clientReceive = LobbyServerGetClientMap_scr(uidReceive);

var buffSend = NetMsgWriteSendHolePunchTo_scr(uidReceive);
network_send_udp(socket, clientSend[? CLIENT_IP],
  clientSend[? CLIENT_PORT], buffSend, buffer_tell(buffSend));
buffer_delete(buffSend);
