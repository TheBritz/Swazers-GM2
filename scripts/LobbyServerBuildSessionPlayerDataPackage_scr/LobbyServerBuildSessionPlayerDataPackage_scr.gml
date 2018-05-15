/// @description LobbyServerBuildSessionPlayerDataPackage_scr(playersList)
/// @param playersList

var playersList = argument0;

var returnList = ds_list_create();

var thisUID, clientData;
for(var i = 0; i < ds_list_size(playersList); i++)
{
  thisUID = playersList[|i];
  
  //Get client data 
  clientData = LobbyServerGetClientMap_scr(thisUID);
  
  //Add the serialized client data to the package
  ds_list_add(returnList, ds_map_write(clientData));
}

return returnList;
