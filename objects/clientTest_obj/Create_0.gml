event_inherited();

global.port = real(get_integer("Enter the port number:", global.port));

socket = network_create_socket(network_socket_udp);
alarm[0] = global.poll_rate;

