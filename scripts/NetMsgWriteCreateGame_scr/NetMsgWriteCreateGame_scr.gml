/// @description NetMsgWriteCreateGame_scr(uid, gameData, buffer)
/// @param uid
/// @param  gameData
/// @param  buffer

var i = 0;
var uid = argument[i++];
var gameData = argument[i++];
gameDataStr = ds_map_write(gameData);
var buff;
if(argument_count > i)
{
  buff = argument[i];
}
else
{
  buff = buffer_create(256, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_CREATE_GAME);
buffer_write(buff, buffer_u32, uid);
buffer_write(buff, buffer_string, gameDataStr);
ds_map_destroy(gameData);

return buff;

