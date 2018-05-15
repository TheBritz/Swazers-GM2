/// @description vectors_combine(dir1, spd1, dir2, spd2)
/// @param dir1
/// @param  spd1
/// @param  dir2
/// @param  spd2
var hspeedHolder = hspeed;
var vspeedHolder = vspeed;

var dir1 = argument0;
var spd1 = argument1;

var dir2 = argument2;
var spd2 = argument3;

direction = dir1;
speed = spd1;

var h1 = hspeed;
var v1 = vspeed;

direction = dir2;
speed = spd2;

var h2 = hspeed;
var v2 = vspeed;

hspeed = h1 + h2;
vspeed = v1 + v2;

var retArr = array(direction, speed);

hspeed = hspeedHolder;
vspeed = vspeedHolder; 

return retArr;


