/// @description Entity_GetCorner_scr(entity, corner [Corners enum])
/// @param entity
/// @param  corner [Corners enum]

enum Corners
{
  TopLeft,
  TopRight,
  BottomRight,
  BottomLeft
}

var entity = argument0;
var corner = argument1;

with(entity)
{
  var mask = mask_index;
  if(mask < 0 )
  {
    mask = sprite_index;
  }  

  var origX = sprite_get_xoffset(mask);
  var origY = sprite_get_yoffset(mask);
  if(corner == Corners.TopLeft)
  {
    var top = sprite_get_bbox_top(mask);
    var left = sprite_get_bbox_left(mask);
    var leftReal = left - origX;
    var topReal = top - origY;
    return array(leftReal, topReal);
  }
  else if(corner == Corners.TopRight)
  {
    var top = sprite_get_bbox_top(mask);
    var right = sprite_get_bbox_right(mask);
    var rightReal = right - origX;
    var topReal = top - origY;
    return array(rightReal, topReal);
  }
  else if(corner == Corners.BottomRight)
  {
    var bottom = sprite_get_bbox_bottom(mask);
    var right = sprite_get_bbox_right(mask);
    var rightReal = right - origX;
    var bottomReal = bottom - origY;
    return array(rightReal, bottomReal);
  }
  else if(corner == Corners.BottomLeft)
  {
    var bottom = sprite_get_bbox_bottom(mask);
    var left = sprite_get_bbox_left(mask);
    var leftReal = left - origX;
    var bottomReal = bottom - origY;
    return array(leftReal, bottomReal);
  }
}

return undefined;

