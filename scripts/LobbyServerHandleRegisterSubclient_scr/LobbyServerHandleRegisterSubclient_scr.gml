/// @description LobbyServerHandleRegisterSubclient_scr(ip, port, buff)
/// @param ip
/// @param  port
/// @param  buff
var writeScript = NetMsgWriteRegisterSubclient_scr;

var ip = argument0;
var port = argument1;
var buff = argument2;

var uid = buffer_read(buff, buffer_u32);

LobbyServerRegisterSubclient_scr(uid, ip, port);

var buff = NetMsgWriteResponse_scr(MESSAGE_REGISTER_SUBCLIENT);
network_send_udp(socket, ip, port, buff, buffer_tell(buff));
buffer_delete(buff);

