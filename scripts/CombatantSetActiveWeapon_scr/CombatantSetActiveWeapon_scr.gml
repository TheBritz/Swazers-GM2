/// @description CombatantSetActiveWeapon_scr(combatant, weapon, slotIndex)
/// @param combatant
/// @param  weapon
/// @param  slotIndex

var combatant = argument0;
var weapon = argument1;
var slotIndex = argument2;

with(combatant)
{
  if(!instance_exists(weapon))
  {
    instance_activate_object(weapon);
  } 

  if(slotIndex < m_weaponsActiveCount)
  {
    ds_list_insert(m_weaponsActive, slotIndex, weapon);
  }
  else
  {
    ds_list_add(m_weaponsActive, weapon);
  }
  
  for(var i = 0; i < ds_list_size(m_weaponsActive); i++)
  {
    if(i + 1 > m_weaponsActiveCount)
    {
      //Put the weapon away if it's above the active weapon count
      CombatantPutWeaponAway_scr(id, m_weaponsActive[| i]);
    }
  }
  
  //If this was the primary weapon being set, change the active weapon index
  if(slotIndex == 0)
  {
    m_weaponsActiveIndex = ds_list_find_index(m_weapons, weapon);
  }
}

