/// @description UIContainerIsPointWithin_scr(container, x, y)
/// @param container
/// @param  x
/// @param  y

var cont = argument0;
var X = argument1;
var Y = argument2;

with(cont)
{
  if(X <= x + UIContainerDisplayWidth_scr(id) && X >= x)
  {
    if(Y <= y + UIContainerDisplayHeight_scr(id) && Y >= y)
    {
      return true;
    }
  }
  return false;
}
