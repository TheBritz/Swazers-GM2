/// @description LobbyServerHandleHello_scr(ip, buff)
/// @param ip
/// @param  buff
var writeScript = NetMsgWriteHello_scr;

var ip = argument0;
var port = argument1;
var buff = argument2;

var helloMapStr = buffer_read(buff, buffer_string);
var helloMap = ds_map_create();
ds_map_read(helloMap, helloMapStr);

var entryCombination = ip + "|" + string(helloMap[? MSG_HELLO_PORT]);

if(!ds_map_exists(clientUIDMap, entryCombination))
{
  uid = LobbyServerAddClient_scr(helloMap[?MSG_HELLO_GAME_NAME], 
    ip, port, helloMap[? MSG_HELLO_PORT_SESSION], helloMap[? MSG_HELLO_IP_LOCAL]);   
}
else
{
  uid = clientUIDMap[? entryCombination];
}
buffer = NetMsgWriteWelcome_scr(serverPort, uid);
network_send_udp(socket, ip, port, buffer, buffer_tell(buffer));
buffer_delete(buffer);
