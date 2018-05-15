/// @description CombatantPutWeaponAway_scr(combatant, weapon)
/// @param combatant
/// @param  weapon

var combatant = argument0;
var weapon = argument1;

with(combatant)
{
  var wepInd = ds_list_find_index(m_weaponsActive, weapon);
  if(wepInd != -1)
  {
    //Deactivate the weapon instance
    weapon.m_weaponTriggerPulled = false;
    instance_deactivate_object(weapon);
    ds_list_delete(m_weaponsActive, wepInd); 
  }
}
