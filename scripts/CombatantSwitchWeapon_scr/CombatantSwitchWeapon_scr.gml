/// @description CombatantSwitchWeapon_scr(combatant, direction)
/// @param combatant
/// @param  direction

var combatant = argument0;
var dir = argument1;

with(combatant)
{
  var currentWep = m_weapons[| m_weaponsActiveIndex];  

  //Shift the active weapon index
  m_weaponsActiveIndex += dir;
  
  //Do a boundary check
  if(m_weaponsActiveIndex >= ds_list_size(m_weapons))
  {
    m_weaponsActiveIndex = 0;
  }
  else if(m_weaponsActiveIndex < 0)
  {
    m_weaponsActiveIndex = ds_list_size(m_weapons) - 1;
  }
  
  if(currentWep != m_weapons[| m_weaponsActiveIndex])
  {
    //Now that we have an index value that's been vetted, perform the weapon switch
    CombatantSetActiveWeapon_scr(id, m_weapons[| m_weaponsActiveIndex], 0);
  }
}
