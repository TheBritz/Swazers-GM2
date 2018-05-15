/// @description NetMsgWriteRequestJoinResonse_scr(answer [0=no 1=yes], joinData [if yes], reason [if no], joinUID, buffer [optional])
/// @param answer [0=no 1=yes]
/// @param  joinData [if yes]
/// @param  reason [if no]
/// @param  joinUID
/// @param  buffer [optional]

var i = 0;
var answer = argument[i++];
var joinData = argument[i++];
var reason = argument[i++];
var joinUID = argument[i++];

//If yes, include joinData
var joinDataStr = "";
if(answer)
{
  joinDataStr = ds_list_write(joinData);
}

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
buffer_write(buff, buffer_u8, MESSAGE_JOIN_RESPONSE);
buffer_write(buff, buffer_bool, answer);
buffer_write(buff, buffer_string, joinDataStr);
buffer_write(buff, buffer_u8, reason);
buffer_write(buff, buffer_u32, joinUID);

return buff;
