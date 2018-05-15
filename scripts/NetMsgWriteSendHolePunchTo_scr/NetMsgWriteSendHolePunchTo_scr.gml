/// @description NetMsgWriteSendHolePunchTo_scr(uid, buffer [optional])
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
  buff = buffer_create(40, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_SEND_HOLEPUNCH_TO);
buffer_write(buff, buffer_u32, uid);

return buff;
