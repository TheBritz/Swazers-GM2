/// @description NetMsgWriteHello_scr(gameName, lobbyPort, sessionPort, localIP, buffer [optional])
/// @param gameName
/// @param  lobbyPort
/// @param  sessionPort
/// @param  localIP
/// @param  buffer [optional]

var helloMap = ds_map_create();
ds_map_add(helloMap, MSG_HELLO_GAME_NAME, argument[0]);
ds_map_add(helloMap, MSG_HELLO_PORT, argument[1]);
helloMap[? MSG_HELLO_PORT_SESSION] = argument[2];
ds_map_add(helloMap, MSG_HELLO_IP_LOCAL, argument[3]);
var helloStr = ds_map_write(helloMap);
ds_map_destroy(helloMap);

var buff = undefined;
if(argument_count > 4)
{
  buff = argument[4];  
}

if(is_undefined(buff))
{
  buff = buffer_create(256, buffer_grow, 1);
}

buffer_write(buff, buffer_u8, MESSAGE_HELLO);
buffer_write(buff, buffer_string, helloStr);

return buff; 
