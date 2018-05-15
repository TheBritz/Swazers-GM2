/// @description SingletonCreate_scr(x, y, obj)
/// @param x
/// @param  y
/// @param  obj

var xx = argument0;
var yy = argument1;
var obj = argument2;

var instNum = instance_number(obj);

var inst; 
if(instNum == 0)
{
  inst = instance_create(xx, yy, obj);
}
else
{
  inst = instance_find(obj, 0);
}

return inst;

