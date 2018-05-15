/// @description AmmoGetDisplaySpriteForProjectileObject_scr(projectileObjectIndex)
/// @param projectileObjectIndex

var projObjInd = argument0;
var dispSprInd = global.ammoDisplayMap[? projObjInd];

if(is_undefined(dispSprInd))
{
  dispSprInd = AMMO_DEFAULT_DISPLAY;
}

return dispSprInd;
