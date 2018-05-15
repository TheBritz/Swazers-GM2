/// @description Collidable_PlaceMeeting_scr(x, y, hitter, hittee)
/// @param x
/// @param  y
/// @param  hitter
/// @param  hittee

var xx = argument0;
var yy = argument1;
var hitter = argument2;
var hittee = argument3;
var hitteeName = object_get_name(hittee);

var hitterMask = Collidable_GetHitterMask_scr(hitter);

if(instance_number(HitboxHitter_obj) < 1)
{
  instance_create(x, y, HitboxHitter_obj);
}

with(HitboxHitter_obj)
{
  var maskHolder = Collidable_GetHitteeMask_scr(hitter);
  mask_index = hitterMask;
  var retVal = instance_place(xx, yy, hittee);
  mask_index = maskHolder; 
  return retVal;        
} 
