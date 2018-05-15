/// @description ClientSessionHostSendEnvironmentGenData_scr(clientData)
/// @param clientData

var clientData = argument0;

var buff = buffer_create(256, buffer_grow, 1);

var envInst;
for(var i = 0; i < instance_number(environmentBase_obj); i++)
{
  envInst = environmentMap[? i]; 
  
  if(!is_undefined(envInst))
  {
    buff = NetMsgWriteUpdateEnvironment_scr(i, envInst, buff);
    network_send_udp(socket, clientData[? CLIENT_IP], 
    clientData[? CLIENT_PORT_SESSION], buff, buffer_tell(buff));
  }
  
  //Send this instance's data to the requesting client
  buffer_fill(buff, 1, buffer_u8, 0, buffer_tell(buff));
  buffer_seek(buff, buffer_seek_start, 1);
}

buffer_delete(buff);

