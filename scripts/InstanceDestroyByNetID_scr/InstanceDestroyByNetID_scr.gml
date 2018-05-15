/// @description InstanceDestroyByNetID_scr(netID)
/// @param netID

var netID = argument0;

var localInstance = global.clientSession.localByNetMap[? netID];

if(instance_exists(localInstance))
{
  with(localInstance)
  {
    instance_destroy();
  }
}
