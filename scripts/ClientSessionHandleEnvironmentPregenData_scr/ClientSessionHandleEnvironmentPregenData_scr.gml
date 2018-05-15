/// @description ClientSessionHandleEnvironmentPregenData_scr(buffer)
/// @param buffer
var writeScript = NetMsgWriteEnvironmentPregenData_scr;

var buff = argument0;

environmentInstanceNumber = buffer_read(buff, buffer_u32);
environmentMap = ds_map_create();

var buffResponse = NetMsgWriteEnvironmentGenReady_scr(uid);
//Let the host know that this client is ready to receive environment data
network_send_udp(socket, hostData[? CLIENT_IP], hostData[? CLIENT_PORT_SESSION],
  buffResponse, buffer_tell(buffResponse));

buffer_delete(buffResponse);
