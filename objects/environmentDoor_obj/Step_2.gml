/// @description Handle door closing
event_inherited();

if(!solid && m_active)
{
  //Check for players to add to the monitor list
  with(playerBase_obj)
  {
    mask_index = movementMask;
  }
  var playerList = instance_place_list(x, y, playerBase_obj, 6);
  with(playerBase_obj)
  {
    mask_index = combatMask;
  }
  var player;
  for(var i = 0; i < ds_list_size(playerList); i++)
  {
    player = playerList[|i];
    if(ds_list_find_index(m_playerMonitorList, player) == -1)
    {
      ds_list_add(m_playerMonitorList, player);
    }
  }
  
  var dirToPlayer;
  var dirDiff;
  for(var i = 0; i < ds_list_size(m_playerMonitorList); i++)
  {
    player = m_playerMonitorList[|i];
    if(!place_meeting(x, y, player))
    {
      //Check direction to this player, if it's the direction into the room,
      //the door will turn solid as it "locks"
      dirToPlayer = point_direction(x, y, player.x, player.y);
      dirDiff = angle_difference(dirToPlayer, direction);
      if(abs(dirDiff) < 70)
      {
        //Code to begin room goes here
        solid = true;
        m_active = false;
        image_index = 1;
      }
    }
  }
}

