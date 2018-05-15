/// @description ClientSessionCreate_scr(uid, peerList, hostUID, socket)
/// @param uid
/// @param  peerList
/// @param  hostUID
/// @param  socket

var _uid = argument0;
var _peerList = argument1;
var _hostUID = argument2;
var _socket = argument3;

var clientSession = instance_create(0, 0, clientSession_obj);

with(clientSession)
{
  peerList = _peerList;
  hostUID = _hostUID;
  socket = _socket;
  uid = _uid;
  
  //Set isHost
  isHost = (uid == hostUID);
  
  //Get host data and build peer map
  peerMap = ds_map_create();
  var clientMap;
  var buff = NetMsgWriteHolePunch_scr(uid);
  for(var i = 0; i < ds_list_size(peerList); i++)
  {
    clientMap = peerList[|i];
    peerMap[? clientMap[? CLIENT_UID]] = clientMap;
    if(!isHost && clientMap[? CLIENT_UID] == hostUID)
    {
      clientSession.hostData = clientMap;
    } 
    //network_send_udp(socket, clientMap[? CLIENT_IP_SESSION],
      //clientMap[? CLIENT_PORT_SESSION], buff, buffer_tell(buff));  
  }
  buffer_delete(buff);
  alarm[0] = heartbeatRate;
}

global.clientSession = clientSession;
return clientSession;
