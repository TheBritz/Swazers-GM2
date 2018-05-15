/// @description ClientSessionDisconnect_scr(peerList)
/// @param peerList

//Sends a disconnect message to each client
var peerList = argument0;

var buff = NetMsgWriteSessionDisconnect_scr(uid);

var peerData;
for(var i = 0; i < ds_list_size(peerList); i++)
{
  peerData = peerList[|i];
  network_send_udp(socket, peerData[? CLIENT_IP], 
    peerData[? CLIENT_PORT], buff, buffer_tell(buff));
}

//Destroy the buffer
buffer_delete(buff);

