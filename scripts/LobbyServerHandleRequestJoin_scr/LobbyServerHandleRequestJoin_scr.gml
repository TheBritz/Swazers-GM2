/// @description LobbyServerHandleRequestJoin_scr(ip, buff)
/// @param ip
/// @param  buff
var writeScript = NetMsgWriteRequestJoin_scr;

var ip = argument0;
var buff = argument1;

buffer_seek(buff, buffer_seek_start, 0);
var gameName = buffer_read(buff, buffer_string);
var clientUID = buffer_read(buff, buffer_u32);
var hostUID = buffer_read(buff, buffer_u32);
var password = buffer_read(buff, buffer_string);

//Get the port to respond to
var clientMap = LobbyServerGetClientMap_scr(clientUID);
var responsePort = clientMap[? CLIENT_PORT];

//Get session data
var gameSession = GameSessionGetSession_scr(gameName, hostUID);

//Check if we got a valid game session using that name
if(!is_undefined(gameSession))
{
  //Game session is valid
  //Get password
  var gamePassword = gameSession[? GAME_SESSION_PASSWORD];
  
  //Get players list
  var playersList = gameSession[? GAME_SESSION_PLAYERS_LIST];
  
  //Get maximum player count for the session
  var playersMax = gameSession[? GAME_SESSION_PLAYERS_MAX];
  
  //If there's a password, check that it's correct
  if(is_undefined(gamePassword) || password == gamePassword)
  {
    //Check if there's room in the game
    if(is_undefined(playersMax) || ds_list_size(playersList) < playersMax)
    {
      //There's room - check join policy
      //TODO: Add join policy checking for friends / invite 
      var joinPolicy = gameSession[? GAME_SESSION_JOIN_POLICY];
      if(joinPolicy == JOIN_POLICY_ALL)
      {
        //Get the client data for the joining client and send it to the other clients
        LobbyServerDistributeJoiningPlayerData_scr(clientUID, playersList)
      
        //Build the player client data package
        var dataPackage =
          LobbyServerBuildSessionPlayerDataPackage_scr(playersList);               
            
        //Add this client to the players list
        ds_list_add(playersList, clientUID);
        
        //Respond to let the client join the game
        var buff = 
          NetMsgWriteRequestJoinResonse_scr(true, dataPackage, 0, hostUID);
          
        network_send_udp(socket, ip, responsePort, buff, buffer_tell(buff));
        buffer_delete(buff);  
      }
      else if(joinPolicy == JOIN_POLICY_FRIENDS)
      {
        //Check if this client is a friend
      }
    }
    else 
    {
      //Deny join due to too many players
      //TODO: Add capability for spectators
      
    }
  }
  else
  {
    //Deny join due to incorrect password
  }
}
else
{
  //Game session was not valid - no game with the given name exists
  var buff = NetMsgWriteRequestJoinResonse_scr(false, "", JOIN_DENIAL_REASON_BAD_GAME_NAME, 0);
  network_send_udp(socket, ip, responsePort, buff, buffer_tell(buff));
  buffer_delete(buff);
}

