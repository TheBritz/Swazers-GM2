/// @description ClientSessionHandleNetIDAssign_scr(buffer)
/// @param buffer

var buff = argument0;
var localID = buffer_read(buff, buffer_u32);
var netID = buffer_read(buff, buffer_u32);

//Check if this instance still exists 
if(instance_exists(localID))
{
  //Assign the net ID
  localID.netID = netID;
  
  localByNetMap[? netID] = localID;
  netByLocalMap[? localID] = netID;
}
