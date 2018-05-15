/// @description ClientSessionHandleUpdateBasic_scr(buffer)
/// @param buffer
var writeScript = NetMsgWriteUpdateBasic_scr;

var buff = argument0;
var msgMap = ds_map_create();
var recipient = buffer_read(buff, buffer_u32);
ds_map_read(msgMap, buffer_read(buff, buffer_string));

//Check if there's a local representation of this network object
var localID = localByNetMap[? recipient];
if(is_undefined(localID))
{
  //There's not yet a representation of this
  var objectName = msgMap[? MSG_UPDATE_OBJECT];
  var object = string_replace(objectName, "_obj", "Shadow_obj");
  var object = asset_get_index(objectName);
  
  //Make sure we got an actual asset index
  var shadow = -1;
  if(shadow == -1)
  {
    //Use the basic shadow object
    shadow = entityNetworkShadow_obj;  
  }
  localID = instance_create(0, 0, shadow);
  localID.netID = recipient;
  localByNetMap[? recipient] = localID;
  netByLocalMap[? localID] = recipient;
}

//Check if there's a message addressed to this recipient
if(instance_exists(localID))
{
  var currentMessage = localID.updateMessage;
  if(!is_undefined(currentMessage) )
  {
    //Make sure the new message's currency value is greater than what's here
    var newCurrency = msgMap[? MSG_UPDATE_CURRENCY];
    var oldCurrency = currentMessage[? MSG_UPDATE_CURRENCY];
    if(newCurrency > oldCurrency)
    {
      localID.updateMessage = msgMap;
    }
  }
  else
  {
    localID.updateMessage = msgMap;
  }
}
