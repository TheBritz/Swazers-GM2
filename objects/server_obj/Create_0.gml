/// @description server_obj Init

/*
The server object - all outbound network data goes
through this badboy.
*/

//Server global variable: used to access server stuff 
global.Server = id;

//UpdateMaps ds_map member. 
//Keys are network_id's, Values are serialized update maps 
//(Ready to send!)
UpdateMaps = ds_map_create();

socket = undefined;



/* */
/*  */
