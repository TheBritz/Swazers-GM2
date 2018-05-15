/// @description Hitbox_PlaceMeeting_scr(x, y, hitterMask, hitteeMask)
/// @param x
/// @param  y
/// @param  hitterMask
/// @param  hitteeMask

var xx = argument0;
var yy = argument1;
var hitterMask = argument2;
var hitteeMask = argument3;

with(HitboxHitter_obj)
{
  var retVal = place_meeting(xx, yy, HitboxHittee_obj);
  return retVal;
}

