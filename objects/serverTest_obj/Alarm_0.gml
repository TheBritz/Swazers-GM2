var buff = buffer_create(32, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_s16, 100);
buffer_write(buff, buffer_s16, 250);
//var test = network_send_udp(socket, "127.0.0.1", global.port, buff, buffer_tell(buff));

//var test2 = network_send_broadcast(socket, global.port, buff, buffer_tell(buff));
alarm[0] = global.poll_rate;

