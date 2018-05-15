/// @description Close all open log files

var key = ds_map_find_first(global.LogMap);
var size = ds_map_size(global.LogMap) ;
for (var i = 0; i < size; i++;)
{
  file_text_close(global.LogMap[? key]);
  key = ds_map_find_next(global.LogMap, key);
}
    

