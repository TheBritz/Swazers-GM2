/// @description OutboxDepositUpdate_scr(netID, updateMap)
/// @param netID
/// @param  updateMap

var nID = argument0;
var uMap = argument1;

if(!is_undefined(nID))
{
  global.clientSession.outboxMap[? nID] = uMap;
  ds_list_add(global.clientSession.recipientList, nID);
}
