/// @description Destroy Session Client
event_inherited();

//Send out disconnect message to all peers
ClientSessionDisconnect_scr(peerList);

//Destroy this client's socket
network_destroy(socket);

//Destroy this client's buffer
buffer_delete(buffer);

//Destroy this client's data structure resources
var peerData;
for(var i = 0; i < ds_list_size(peerList); i++)
{
  peerData = peerList[|i];
  ds_map_destroy(peerData);
}

ds_list_destroy(peerList);
ds_list_destroy(recipientList);
ds_map_destroy(peerMap);
ds_map_destroy(outboxMap);


