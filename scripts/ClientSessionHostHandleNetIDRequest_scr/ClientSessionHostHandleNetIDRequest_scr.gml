/// @description ClientSessionHostHandleNetIDRequest_scr(buffer)
/// @param buffer
var writeScript = NetMsgWriteRequestNetID_scr;

var buff = argument0;
var uid = buffer_read(buff, buffer_u32);
var localID = buffer_read(buff, buffer_u32);

var clientMap = peerMap[? uid];

var buff = NetMsgWriteAssignNetID_scr(localID, ++netID);

//localByNetMap[? netID] = localID;
//netByLocalMap[? localID] = netID;

//Send back the net id assignment 
network_send_udp(socket, clientMap[? CLIENT_IP], 
  clientMap[? CLIENT_PORT_SESSION], buff, buffer_tell(buff));


