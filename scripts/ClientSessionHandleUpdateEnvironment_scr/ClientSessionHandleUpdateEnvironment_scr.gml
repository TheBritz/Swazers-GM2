/// @description ClientSessionHandleUpdateEnvironment_scr(buffer)
/// @param buffer
var writeScript = NetMsgWriteUpdateEnvironment_scr;

var buff = argument0;

var updateNumber = buffer_read(buff, buffer_u32);

if(!ds_map_exists(environmentMap, updateNumber))
{
  //Create environment instance
  var envObjType = asset_get_index(buffer_read(buff, buffer_string));
  buffer_write(buff, buffer_u32, x); 
  buffer_write(buff, buffer_u32, y);
  
  var envInstance = instance_create(x, y, envObjType);
  
  with(envInstance)
  {
    image_angle = buffer_read(buff, buffer_u16);
    image_xscale = buffer_read(buff, buffer_u32);
    image_yscale = buffer_read(buff, buffer_u32);
  } 
}
