/// @description InboxGetUpdate_scr(netID)
/// @param netID
//Returns an update map for the given network id

var nID = argument0;

if(instance_exists(global.networkInbox))
{
  return global.networkInbox.inboxMap[? nID];
}
