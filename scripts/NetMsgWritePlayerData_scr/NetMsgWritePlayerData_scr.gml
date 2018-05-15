/// @description NetMsgWritePlayerData_scr(clientData, buffer [optional])
/// @param clientData
/// @param  buffer [optional]

var i = 0;
var clientData = argument[i++];
var clientDataStr = ds_map_write(clientData);

var buff;
if(argument_count > i)
{
  buff = argument[i];
}
else
{
  buff = buffer_create(128, buffer_grow, 1);
}

buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u8, MESSAGE_PLAYER_DATA);
buffer_write(buff, buffer_string, clientDataStr);

return buff;


