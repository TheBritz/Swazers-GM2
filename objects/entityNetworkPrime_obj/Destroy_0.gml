/// @description Destroy all shadow instances
event_inherited();

var args = ds_list_create();
ds_list_add(args, netID);
var buff = NetMsgWriteScriptExecute_scr
  (RemoteScriptInstanceDestroyByNetID_scr, args);
  
ClientSessionDistributeMessageToPeers_scr(buff);

buffer_delete(buff);

ds_list_destroy(args);

///Clean up the udpate map

ds_map_destroy(updateMap);

