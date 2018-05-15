/// @description Heartbeat
var clientMap;
if(!is_undefined(peerList))
{
  for(var i = 0; i < ds_list_size(peerList); i++)
  {
    var clientMap = peerList[|i];
    //ClientSessionHolePunchShotgun_scr(uid, clientMap, 1);
  }
}

alarm[0] = heartbeatRate;

