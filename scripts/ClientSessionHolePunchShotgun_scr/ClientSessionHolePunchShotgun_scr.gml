/// @description ClientSessionHolePunchShotgun_scr(clientMap, spread)
/// @param clientMap
/// @param  spread

var _uid = argument0;
var clientMap = argument1;
var spread = argument2;
var buff = NetMsgWriteHolePunch_scr(_uid);

var ip = clientMap[? CLIENT_IP_SESSION];
var port = clientMap[? CLIENT_PORT_SESSION];

for(var portCur = port - spread; portCur < port + spread; portCur++)
{
  network_send_udp(socket, ip, portCur, buff, buffer_tell(buff));
}

buffer_delete(buff);
