/// @description ClientLobbyHandlePlayerData_scr(buffer)
/// @param buffer
var writeScript = NetMsgWritePlayerData_scr;

var buff = argument0;

var clientMapStr = buffer_read(buff, buffer_string);
var clientMap = ds_map_create();
ds_map_read(clientMap, clientMapStr);

with(global.clientSession)
{
  ds_list_add(peerList, clientMap);
  peerMap[? clientMap[? CLIENT_UID]] = clientMap;
  
  //p2p connect - This message isn't intended to reach the recipient but opens
  //up the NAT for this session client to be open to receiving messages from
  //the recipient 
  var buff = NetMsgWriteHolePunch_scr(uid);
  network_send_udp(socket, clientMap[? CLIENT_IP_SESSION], 
    clientMap[? CLIENT_PORT_SESSION], buff, buffer_tell(buff));
  network_send_udp(socket, clientMap[? CLIENT_IP_LOCAL],
    clientMap[? CLIENT_PORT_SESSION], buff, buffer_tell(buff));
  buffer_delete(buff);
}

//Let the server know it needs to tell the peer to respond
var uidToSend = clientMap[? CLIENT_UID];
var uidToReceive = uid;
var buff = NetMsgWriteConnectSessionPeers_scr(uidToSend, uidToReceive);
network_send_udp(socket, global.LobbyIP, serverPort, buff, buffer_tell(buff));
buffer_delete(buff);
