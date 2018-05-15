/// @description DebugSetPressMap_scr(pressMap, value [true or false], [optional] allButThis)
/// @param pressMap
/// @param  value [true or false]
/// @param  [optional] allButThis

var pressMap = argument[0];
var value = argument[1];
var allButThis = 0;
if(argument_count > 2)
{
  allButThis = argument[2];
}

var key = ds_map_find_first(pressMap);
while(!is_undefined(key))
{
  if(key != allButThis)
  {
    ds_map_replace(pressMap, key, value);
  }
  key = ds_map_find_next(pressMap, key);
}
