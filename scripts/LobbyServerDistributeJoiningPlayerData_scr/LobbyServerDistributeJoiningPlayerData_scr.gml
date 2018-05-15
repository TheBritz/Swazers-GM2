/// @description LobbyServerDistributeJoiningPlayerData_scr(joiningClientUID, playersList)
/// @param joiningClientUID
/// @param  playersList

var joiningClientUID = argument0;
var playersList = argument1;

//Get joining client data
var joiningClientData = LobbyServerGetClientMap_scr(joiningClientUID);

//Write the buffer
var buff = NetMsgWritePlayerData_scr(joiningClientData);

var thisUID, clientData;
for(var i = 0; i < ds_list_size(playersList); i++)
{
  thisUID = playersList[|i];
  
  //Get client data
  clientData = LobbyServerGetClientMap_scr(thisUID);
  
  //Send to the lobby client
  network_send_udp(socket, clientData[? CLIENT_IP_SESSION], 
    clientData[? CLIENT_PORT], buff, buffer_tell(buff));
}
