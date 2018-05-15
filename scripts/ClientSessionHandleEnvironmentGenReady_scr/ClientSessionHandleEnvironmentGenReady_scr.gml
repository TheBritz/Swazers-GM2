/// @description ClientSessionHandleEnvironmentGenReady_scr(buffer)
/// @param buffer
var writeScript = NetMsgWriteEnvironmentGenReady_scr;

var buff = argument0;

var clientUID = buffer_read(buff, buffer_u32);
var clientData = peerMap[? clientUID];

if(is_undefined(environmentMap))
{
  ClientSessionHostInitEnvironmentMap_scr();
}

ClientSessionHostSendEnvironmentGenData_scr(clientData);
