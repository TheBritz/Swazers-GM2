/// @description NetMsgWriteRequestGames_scr(gameName, uid, buffer [optional])
/// @param gameName
/// @param  uid
/// @param  buffer [optional]

var i = 0;
var gameName = argument[i++];
var uid = argument[i++];
var buff;
if(argument_count > i)
{
  buff = argument[i];
}
else
{
  buff = buffer_create(40, buffer_fixed, 4);
}

buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u8, MESSAGE_REQUEST_GAMES);
//buffer_write(buff, buffer_string, gameName);
buffer_write(buff, buffer_u32, uid);

return buff;

