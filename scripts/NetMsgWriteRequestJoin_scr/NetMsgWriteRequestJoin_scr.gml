/// @description NetMsgWriteRequestJoin_scr(gameName, clientUID, hostUID, password, buffer [optional])
/// @param gameName
/// @param  clientUID
/// @param  hostUID
/// @param  password
/// @param  buffer [optional]

var i = 0;
var gameName = argument[i++];
var clientUID = argument[i++];
var hostUID = argument[i++];
var password = argument[i++];

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
buffer_write(buff, buffer_u8, MESSAGE_REQUEST_JOIN);
buffer_write(buff, buffer_string, gameName);
buffer_write(buff, buffer_u32, clientUID);
buffer_write(buff, buffer_u32, hostUID);
buffer_write(buff, buffer_string, password);

return buff;


