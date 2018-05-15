/// @description ControlsDirectionFromGamepadAxes_scr(axisH, axisV)
/// @param axisH
/// @param  axisV
var axisH = argument0;
var axisV = argument1;

var hspeedHolder = hspeed;
var vspeedHolder = vspeed;

hspeed = axisH;
vspeed = axisV;

var dir = direction;

hspeed = hspeedHolder;
vspeed = vspeedHolder;

return dir;
