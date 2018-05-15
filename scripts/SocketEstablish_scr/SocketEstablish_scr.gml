var retArr;
var socket = -1;

for(var i = 0; i < ds_list_size(global.LobbyClientPortRanges); i++)
{
  var range = global.LobbyClientPortRanges[|i];
  var port = range[0];

  while(socket < 0)
  {
    socket = network_create_socket_ext(network_socket_udp, port);
    if(socket >= 0)
    {
      retArr[0] = socket;
      retArr[1] = port;
    }
    else
    {
      port++;
    }
    
    if(port > range[1])
    {
      //Server options have been exausted... terminate process (warn user)
      trace(@"The Lobby server could not be properly initialized; 
            none of the listening ports it can use is free.");
    }
  }
}

return retArr;
