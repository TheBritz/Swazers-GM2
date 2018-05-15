/// @description entityNetworkClient_obj Init

/*
This entity is a network entity that will RECEIVE
updates from entity_network_server_obj's that have 
the same netID 
*/

event_inherited();

//The member for containing update messages
updateMessage = undefined;

inbox = noone;

/* */
/*  */
