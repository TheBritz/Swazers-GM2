/// @description entityNetworkPrime_obj Init

/*
This entity is a network entity that will UPDATE
entityNetworkShadow_obj's that have the same
netID on other clients
*/

//Instance Modifiers
m_modifiers = undefined;

event_inherited();

//Define the network ID
netID = undefined;

//Concurrency value
currency = 0;

//Request a network ID from the host
ClientSessionRequestNetworkID_scr(id);

//Create the reusable update map
updateMap = ds_map_create();

//Set the shadow object
shadowObject = entityNetworkShadow_obj;



/* */
/*  */
