/// @description Ancestor events
event_inherited();

///Send update to outbox

if(ds_exists(updateMap, ds_type_map))
{
  //Clean the update map
  //ds_map_clear(updateMap);
  
  //Add concurrency
  updateMap[? MSG_UPDATE_CURRENCY] = currency;
  
  //Add coords
  var coords = string(x) + "|" + string(y);
  updateMap[? MSG_UPDATE_COORDS] = coords;
  
  //Add depth
  updateMap[? MSG_UPDATE_DEPTH] = depth;
  
  //Add speed
  updateMap[? MSG_UPDATE_SPEED] = speed;
  
  //Add image angle
  updateMap[? MSG_UPDATE_IMAGE_ANGLE] = image_angle;
  
  //Add sprite
  updateMap[? MSG_UPDATE_SPRITE] = sprite_get_name(sprite_index);
  
  //Add image index
  updateMap[? MSG_UPDATE_IMAGE_INDEX] = image_index;
  
  //Add object name
  updateMap[? MSG_UPDATE_OBJECT] = object_get_name(object_index);
  
  //Deposit the message
  OutboxDepositUpdate_scr(netID, updateMap);
  
  //Increment concurrency value
  currency++;
}


