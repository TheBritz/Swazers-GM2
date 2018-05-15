/// @description ipProbe_obj Init

socket = -1; 
var port;
while(socket < 0)
{
  port = irandom_range(49152,65535);
  socket = network_create_server(network_socket_udp, port, 5);
}

probeSock = network_create_socket(network_socket_udp);
var tbuff = buffer_create(32, buffer_fixed, 1);
buffer_fill(tbuff, 0, buffer_bool, 0, 32);
network_send_broadcast(probeSock, port, tbuff, buffer_get_size(tbuff));
network_destroy(probeSock);
buffer_delete(tbuff);


