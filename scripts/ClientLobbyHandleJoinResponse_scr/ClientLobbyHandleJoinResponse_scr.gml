/// @description ClientLobbyHandleJoinResponse_scr(buffer)
/// @param buffer
var writeScript = NetMsgWriteRequestJoinResonse_scr;

var buff = argument0;

//Read out the buffer
var answer = buffer_read(buff, buffer_bool);
var dataStr = buffer_read(buff, buffer_string);
var reason = buffer_read(buff, buffer_u8);
var hostUID = buffer_read(buff, buffer_u32);

//Check if the answer is yes (true)
if(answer)
{
  //The answer is yes, start the joining process
  var dataList = ds_list_create();
  
  ds_list_read(dataList, dataStr);
  
  var clientMap;
  for(var i = 0; i < ds_list_size(dataList); i++)
  {
    //Create and read-in the client map
    clientMap = ds_map_create();
    ds_map_read(clientMap, dataList[|i]);
    //Add the client map to the peer list
    ds_list_add(peerList, clientMap);  
  }
  
  //Create the session client
  ClientSessionCreate_scr(uid, peerList, hostUID, sessionSocket);
  //Go to the test room
  room_goto(room3);
}
else
{
  //The answer is no, give the reason
  switch(reason)
  {
    case JOIN_DENIAL_REASON_FULL:
    {
      show_message("Unable to join because the game is full.");
      break;
    }
    case JOIN_DENIAL_REASON_BAD_GAME_NAME:
    {
      show_message("No game of the given name could be found.");
      break;
    }
    case JOIN_DENIAL_REASON_PASSWORD:
    {
      show_message("Incorrect password.");
      break;
    }
  }
}



