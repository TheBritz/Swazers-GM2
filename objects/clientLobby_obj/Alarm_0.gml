/// @description Send hello
if(!inLobby)
{
  //Send to all possible lobby server ports - we'll get
  //the actual lobby server port when the client gets
  //the 'WELCOME' message
  for(var port = global.LobbyPortRange[0]; port <= global.LobbyPortRange[1]; port++)
  {
    network_send_udp(socket, global.LobbyIP, port, helloBuffer, buffer_tell(helloBuffer));
  }
  
  alarm[hello_alarm_ind] = hello_ping_rate;
}

