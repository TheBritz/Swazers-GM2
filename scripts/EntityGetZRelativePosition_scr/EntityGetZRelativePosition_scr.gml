/// @description EntityGetZRelativePosition_scr(referenceY, y)
/// @param referenceY
/// @param  y

var refY = argument0;
var yy = argument1;

var diff = yy - refY;
var z = diff/m_zCoef;
return z;
