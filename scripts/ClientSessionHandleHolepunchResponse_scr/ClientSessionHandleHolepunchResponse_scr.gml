/// @description ClientSessionHandleHolepunch_scr(ip, port, buff)
/// @param ip
/// @param  port
/// @param  buff

var _uid = buffer_read(buffer_u32, buff);

var buffResponse = NetMsgWriteHolePunch_scr(uid);
network_send_udp(socket, ip, port, buffResponse, buffer_tell(buffResponse)); 
