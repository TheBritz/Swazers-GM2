event_inherited();

buffer = buffer_create(256, buffer_grow, 1);

//Unique id's for clients that connect to this server.
//This value will be incremented every time a client is added
UID = 0;

//Game groups
gameGroups = ds_map_create();
gameNameByUID = ds_map_create();

//Stores client data using UID keys
//clientsMap = ds_map_create();
//Stores UID values by IP keys
clientUIDMap = ds_map_create();
serverPort = -1;

socket = -1;
var port = global.LobbyPortRange[0];
while(socket < 0)
{
  if(port >= global.LobbyPortRange[1])
  {
    //Server options have been exausted... terminate process (warn user)
    trace(@"The Lobby server could not be properly initialized; 
           none of the ports it can use is free.");
    break;
  }
  socket = network_create_server(network_socket_udp, port, 1000);
  if(socket >= 0)
  {
    serverPort = port;
  }
  else
  {
    port++;
  }
}

if(debug_mode)
{
  show_message_async("Server running on port " + string(serverPort));
}

//Test tcp connection listener
socketTest = network_create_server(network_socket_tcp, 30003, 12);

