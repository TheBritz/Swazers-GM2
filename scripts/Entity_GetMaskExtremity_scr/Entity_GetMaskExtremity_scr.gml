/// @description Entity_GetMaskExtremity_scr(entity, extremity)
/// @param entity
/// @param  extremity

enum Extremity
{
  None = 0,
  Left = -1,
  Right = 1,
  Top = -2,
  Bottom = 2
}

var entity = argument0;
var extremity = argument1;

with(entity)
{
  var mask = mask_index;
  if(mask < 0 )
  {
    mask = sprite_index;
  }  

  var origX = sprite_get_xoffset(mask);
  var origY = sprite_get_yoffset(mask);
  if(extremity == Extremity.Left)
  {
    var left = sprite_get_bbox_left(mask);
    var leftReal = left - origX;
    return leftReal;
  }
  else if(extremity == Extremity.Right)
  {
    var right = sprite_get_bbox_right(mask);
    var rightReal = right - origX;
    return rightReal;
  }
  else if(extremity == Extremity.Top)
  {
    var top = sprite_get_bbox_top(mask);
    var topReal = top - origY;
    return topReal;
  }
  else if(extremity == Extremity.Bottom)
  {
    var bottom = sprite_get_bbox_bottom(mask);
    var bottomReal = bottom - origY;
    return bottomReal; 
  }
}

return undefined;
