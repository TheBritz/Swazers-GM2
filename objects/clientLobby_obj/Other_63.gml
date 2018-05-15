//This event is triggered 
var i_d = ds_map_find_value(async_load, "id");
if i_d == dialogID
{
  if ds_map_find_value(async_load, "status")
  {
    if ds_map_find_value(async_load, "result") != ""
    {
      //Create game
      var data = GameSessionDataBuild_scr(async_load[?"result"], JOIN_POLICY_ALL); 
      var buff = NetMsgWriteCreateGame_scr(uid, data);
      network_send_udp(socket, global.LobbyIP, serverPort, buff, buffer_tell(buff));
      buffer_delete(buff);
      
      //Create the session client
      ClientSessionCreate_scr(uid, peerList, uid, sessionSocket);
      //Go to the test room
      room_goto(room3);
    }
    else
    {
      
    }
  }
}
else if(i_d == dialogJoinID)
{
  if ds_map_find_value(async_load, "status")
  {
    if ds_map_find_value(async_load, "result") != ""
    {
      //Request to join game
      var buff = NetMsgWriteRequestJoin_scr(async_load[?"result"], uid, 1, "");
      network_send_udp(socket, global.LobbyIP, serverPort, buff, buffer_tell(buff));
      buffer_delete(buff);
    }
  }
}

