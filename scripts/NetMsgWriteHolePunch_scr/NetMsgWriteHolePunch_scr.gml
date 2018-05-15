/// @description NetMsgWriteHolePunch_scr(uid, buffer [optional])
/// @param uid
/// @param  buffer [optional]

var i = 0;
var _uid = argument[i++];
var buff;
if(argument_count > i)
{
  buff = argument[i];
}
else
{
  buff = buffer_create(72, buffer_fixed, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_HOLEPUNCH);
buffer_write(buff, buffer_u32, _uid);

return buff;


