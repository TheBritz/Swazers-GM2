/// @description SerializableMapAddDataStructure_scr(map, key, ds, dsType)
/// @param map
/// @param  key
/// @param  ds
/// @param  dsType

var map = argument0;
var key = argument1;
var ds = argument2;
var dsType = argument3;
var smd = global.SerializableMapData;

if(!ds_map_exists(smd, map))
{
  //No data exists for this data structure; create data entry 
  ds_map_add(smd, map, ds_map_create());
}

var dataMap = smd[?map];

if(!ds_map_exists(dataMap, key))
{
  ds_map_add(dataMap, key, dsType);  
}
else
{
  ds_map_replace(dataMap, key, dsType);
}

ds_map_add(map, key, ds);
