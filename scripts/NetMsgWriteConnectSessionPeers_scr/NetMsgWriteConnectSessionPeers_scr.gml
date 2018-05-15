/// @description NetMsgWriteConnectSessionPeers_scr(uidToSend, uidToReceive, buffer [optional])
/// @param uidToSend
/// @param  uidToReceive
/// @param  buffer [optional]

var i = 0;
var uidSend = argument[i++];
var uidReceive = argument[i++];

var buff;
if(argument_count > i)
{
  buff = argument[i];
}
else
{
  buff = buffer_create(72, buffer_grow, 1);
}

buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u8, MESSAGE_CONNECT_SESSION_PEERS);
buffer_write(buff, buffer_u32, uidSend);
buffer_write(buff, buffer_u32, uidReceive);

return buff;


