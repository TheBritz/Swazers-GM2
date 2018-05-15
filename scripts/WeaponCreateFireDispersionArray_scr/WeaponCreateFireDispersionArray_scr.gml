/// @description WeaponCreateFireDispersionArray_scr(minDispersionRange, maxDispersionRange)
/// @param minDispersionRange
/// @param  maxDispersionRange

var minDisp = argument[0];
if(argument_count > 1)
{
  var maxDisp = argument[1];
  return array(minDisp, maxDisp);
}
else
{
  return array(minDisp, -minDisp);
}


