/// @description BackgroundTest_scr(index)
/// @param index
var index = argument0;
var maxVal = 10000
var ongoing = true;
var progress = floor(index/maxVal * 100);

if(index > maxVal)
{
  ongoing = false;
}

//trace("index = ", index, " progress = ", progress, " ongoing = ", ongoing);

return array(ongoing, progress);
