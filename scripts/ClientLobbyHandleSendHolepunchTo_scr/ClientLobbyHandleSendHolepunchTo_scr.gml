/// @description ClientLobbyHandleSendHolepunchTo_scr(buffer)
/// @param buffer
//var writeScript = NetMsgWritePlayerData_scr;

var buff = argument0;

var _uid = buffer_read(buff, buffer_u32);

with(global.clientSession)
{
  var clientMap = peerMap[? _uid];
  var ip = clientMap[? CLIENT_IP];
  var ipLocal = clientMap[? CLIENT_IP_LOCAL];
  var portSession = clientMap[? CLIENT_PORT_SESSION];
  //p2p connect - Now this holepunch should go through
  var buffRespond = NetMsgWriteHolePunch_scr(uid);
  network_send_udp(socket, ip, portSession, 
    buffRespond, buffer_tell(buff));
  network_send_udp(socket, ipLocal, portSession, 
    buffRespond, buffer_tell(buff));
  buffer_delete(buffRespond);
}

