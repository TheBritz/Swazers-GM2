/// @description NetMsgWriteRegisterSubclient_scr(uid, buffer [optional])
/// @param uid
/// @param  buffer [optional]

var i = 0;
var uid = argument[i++];

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
buffer_write(buff, buffer_u8, MESSAGE_REGISTER_SUBCLIENT);
buffer_write(buff, buffer_u32, uid);

return buff;


