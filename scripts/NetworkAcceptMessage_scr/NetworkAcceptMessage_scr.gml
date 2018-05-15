/// @description NetworkAcceptMessage_scr(socket, readScript)
/// @param socket
/// @param  readScript

var skt = argument0;
var readScript = argument1;

var evID = async_load[?"id"];
if(evID == socket)
{
  var ip = async_load[?"ip"];
  var buff = async_load[?"buffer"];
  var port = async_load[?"port"];
  
  var type = buffer_read(buff, buffer_u8);

  script_execute(readScript, type, ip, port, buff);
}
