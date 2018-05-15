/// @description Network Event
var ev_id = async_load[?"id"];
if(ev_id == socket)
{
  var ip = async_load[?"ip"];
  var buff = async_load[?"buffer"];
  var port = async_load[?"port"];
  
  var type = buffer_read(buff, buffer_u8);
  NetMsgLobbyServerRead_scr(type, ip, port, buff);
}
else if(ev_id == socketTest)
{
  var test = "test";
}

