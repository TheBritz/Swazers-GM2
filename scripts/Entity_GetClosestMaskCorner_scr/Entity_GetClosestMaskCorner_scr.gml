/// @description Entity_GetClosestMaskCorner_scr(entity, x, y)
/// @param entity
/// @param  x
/// @param  y

//Returns the relative coordinates of a given entity's closest corner to x/y
var entity = argument0;
var xx = argument1;
var yy = argument2;

with(entity)
{
  var mask = mask_index;
  if(is_undefined(mask))
  {
    mask = sprite_index;
  }
  
  var origX = sprite_get_xoffset(mask);
  var origY = sprite_get_yoffset(mask);
  var left = sprite_get_bbox_left(mask);
  var right = sprite_get_bbox_right(mask);
  var top = sprite_get_bbox_top(mask);
  var bottom = sprite_get_bbox_bottom(mask);
  
  var leftReal = x - origX + left;
  var rightReal = x - origX + right;
  var topReal = y - origY + top;
  var bottomReal = y - origY + bottom;
  
  var corners, corner;
  corners = array(array(leftReal, topReal), array(rightReal, topReal), array(rightReal, bottomReal), array(leftReal, bottomReal));
  var minDist = 100000000000000;
  var dist, mindex;
  for(var i = 0; i < array_length_1d(corners); i++)
  {
    corner = corners[i];
    dist = point_distance(corner[0], corner[1], xx, yy)
    if(dist < minDist)
    {
      minDist = dist;
      mindex = i;
    }
  }
  
  var closestCorner = corners[mindex];
  
  return array(closestCorner[0] - x, closestCorner[1] - y); 
}
