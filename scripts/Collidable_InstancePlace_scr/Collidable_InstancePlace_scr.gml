/// @description Collidable_InstancePlace_scr(x, y, hitter, hittee)
/// @param x
/// @param  y
/// @param  hitter
/// @param  hittee

var xx = argument0;
var yy = argument1;
var hitter = argument2;
var hittee = argument3;

var hitterMask = Collidable_GetHitterMask_scr(hitter);

with(HitboxHitter_obj)
{
  var maskHolder = Collidable_GetHitteeMask_scr(hitter);
  mask_index = hitterMask;
  var retVal = instance_place(xx, yy, hittee);
  mask_index = maskHolder; 
  return retVal;        
} 
