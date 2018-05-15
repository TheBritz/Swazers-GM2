/// @description Check for update in the inbox
if(!is_undefined(updateMessage))
{
  var update = updateMessage;
  //var update = InboxGetUpdate_scr(netID);
  
  //Update position
  var coords = split(update[? MSG_UPDATE_COORDS], "|");
  coords[0] = real(coords[0]);
  coords[1] = real(coords[1]);
  
  x = coords[0];
  y = coords[1];
  
  //Update depth
  depth = update[? MSG_UPDATE_DEPTH];
  
  //Update speed
  speed = update[? MSG_UPDATE_SPEED];
  
  //Update direction
  direction = update[? MSG_UPDATE_DIRECTION];
  
  //Update image angle
  image_angle = update[? MSG_UPDATE_IMAGE_ANGLE];
  
  //Update sprite
  sprite_index = asset_get_index(update[? MSG_UPDATE_SPRITE]);
  
  //Update image index
  image_index = update[? MSG_UPDATE_IMAGE_INDEX];

  //Update has been applied, destroy message map and set member to undefined
  ds_map_destroy(update);
  updateMessage = undefined;
}

