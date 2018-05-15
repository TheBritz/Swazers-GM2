/// @description ClientSessionHandleEnvironmentPregenData_scr(buffer)
/// @param buffer
var writeScript = NetMsgWriteEnvironmentGenRequest_scr;

var buff = argument0;

var clientUID = buffer_read(buff, buffer_u32);
var clientData = peerMap[? clientUID];

var envInstNum = instance_number(environmentBase_obj);

var buffResponse = NetMsgWriteEnvironmentPregenData_scr(envInstNum);
//Let the host know that this client is ready to receive environment data
network_send_udp(socket, clientData[? CLIENT_IP], clientData[? CLIENT_PORT_SESSION],
  buffResponse, buffer_tell(buffResponse));

buffer_delete(buffResponse);
