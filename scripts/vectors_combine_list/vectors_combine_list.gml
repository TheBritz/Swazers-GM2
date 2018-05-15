/// @description vectors_combine_list(directionSpeedPairList)
/// @param directionSpeedPairList

var dirSpdPairs = argument0;

var hspeedHolder = hspeed;
var vspeedHolder = vspeed;

speed = 0;

var dirSpdPair;
for(var i = 0; i < ds_list_size(dirSpdPairs); i++)
{
  dirSpdPair = dirSpdPairs[|i];
  motion_add(dirSpdPair[0], dirSpdPair[1]);
}

var retArr = array(direction, speed);

hspeed = hspeedHolder;
vspeed = vspeedHolder; 

return retArr;


