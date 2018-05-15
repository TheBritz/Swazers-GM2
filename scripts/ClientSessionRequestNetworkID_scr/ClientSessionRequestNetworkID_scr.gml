/// @description ClientSessionRequestNetworkID_scr(localID)
/// @param localID

var localID = argument0;

with(global.clientSession)
{
  if(isHost)
  {
    //This is the host client - assign id and increment
    localID.netID = ++netID;
    localByNetMap[? netID] = localID;
    netByLocalMap[? localID] = netID;
  }
  else
  {
    //This is a remote client - request from the host
    var buff = NetMsgWriteRequestNetID_scr(uid, localID);

    //Send out request
    network_send_udp(socket, hostData[? CLIENT_IP], 
      hostData[? CLIENT_PORT_SESSION], buff, buffer_tell(buff));
  }   
}
