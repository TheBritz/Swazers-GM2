/// @description CombatantGetPrimaryWeapon_scr(combatantInstance)
/// @param combatantInstance

var combatant = argument0;

if(instance_exists(combatant))
{
  with(combatant)
  {
    if(ds_list_size(m_weaponsActive) > 0)
    {
      return m_weaponsActive[| 0];
      exit;
    }
  }
}

return noone;
