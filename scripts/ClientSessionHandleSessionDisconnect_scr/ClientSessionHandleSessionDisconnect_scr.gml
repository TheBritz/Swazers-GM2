/// @description ClientSessionHandleSessionDisconnect_scr(buffer)
/// @param buffer

var buff = argument0;

var uid = buffer_read(buff, buffer_u32);

//Remove this peer
var peerData = peerMap[? uid];
ds_map_delete(peerData, uid);

//Remove the list entry
var listPos = ds_list_find_index(peerList, peerData);
ds_list_delete(peerList, listPos);

//Delete this peerData
ds_map_destroy(peerData);

if(uid == hostUID)
{
  //Handle host migration case
  
}


