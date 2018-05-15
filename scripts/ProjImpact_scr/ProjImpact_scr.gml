/// @description ProjImpact_scr(x, y, impactObj, depth, imageAngle)
/// @param x
/// @param  y
/// @param  impactObj
/// @param  depth
/// @param  imageAngle

var _x = argument0;
var _y = argument1;
var impactObj = argument2;
var _depth = argument3;
var imageAngle = argument4;

var impact = instance_create(_x, _y, impactObj);

impact.depth = _depth;
impact.image_angle = imageAngle;

return impact;
