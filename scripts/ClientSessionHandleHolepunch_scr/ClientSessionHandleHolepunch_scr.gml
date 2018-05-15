/// @description ClientSessionHandleHolepunch_scr(ip, port, buff)
/// @param ip
/// @param  port
/// @param  buff

var ip = argument0;
var port = argument1;
var buff = argument2;
var _uid = buffer_read(buff, buffer_u32);

var clientMap = peerMap[_uid];
clientMap[? CLIENT_IP_ACTUAL] = ip;
clientMap[? CLIENT_PORT_ACTUAL] = port;

var buffResponse = NetMsgWriteHolePunch_scr(uid);
network_send_udp(socket, ip, port, buffResponse, buffer_tell(buffResponse)); 
