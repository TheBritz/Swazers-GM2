/// @description Ancestor events
event_inherited();



///Combatant movement
if(!is_undefined(m_moveDir))
{
  motion_add(m_moveDir, accel);
}


///Combatant Collision
m_combatantCollisionTimer -= global.timeSpeed;
if(m_combatantCollisionTimer <= 0)
{
  m_combatantCollisionTimer = m_combatantCollisionRate;
  var combatantList = instance_place_list(x, y, entityCombatant_obj, 1000);
  //Add the combatant shadows to the list
  instance_place_list(x, y, entityCombatantShadow_obj, 1000, false, combatantList);
  
  var combatant, pushDirection;
  for(var i = 0; i < ds_list_size(combatantList); i++)
  {
    combatant = combatantList[|i];
    pushDirection = point_direction(x, y, combatant.x, combatant.y);
    if(!object_is(combatant.object_index, playerBase_obj))
    {
      with(combatant)
      {
        motion_add(pushDirection, m_pushAccel);
      }
    }
  }
}

///Monitor activeWeapons
if(m_weaponsActiveCount > ds_list_size(m_weaponsActive))
{
  if(ds_list_size(m_weapons) > ds_list_size(m_weaponsActive))
  {
    for(var i = 0; i < ds_list_size(m_weapons); i++)
    {
      if(ds_list_find_index(m_weaponsActive, m_weapons[|i]) == -1)
      {
        ds_list_add(m_weaponsActive, m_weapons[|i]);
      }
      if(ds_list_size(m_weaponsActive) >= m_weaponsActiveCount)
      {
        break;
      }
    }    
  }
}

//weaponTriggerPulled = false;

