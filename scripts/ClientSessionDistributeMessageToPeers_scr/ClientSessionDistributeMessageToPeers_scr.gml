/// @description ClientSessionDistributeMessageToPeers_scr(messageBuffer)
/// @param messageBuffer

with(global.clientSession)
{
  var buff = argument0;
  var peerData;
  for(var i = 0; i < ds_list_size(peerList); i++)
  {
   peerData = peerList[|i];
   network_send_udp(socket, peerData[? CLIENT_IP], 
     peerData[? CLIENT_PORT_SESSION], buff, buffer_tell(buff)); 
  }
}
