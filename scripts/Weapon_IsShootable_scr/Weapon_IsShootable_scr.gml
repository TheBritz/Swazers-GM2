/// @description Weapon_IsShootable_scr(weapon)
/// @param weapon

var weapon = argument0;

with(weapon)
{
  if(instance_exists(weapon.combatant))
  {
    if(m_fireTimer <= 0 && !m_ammoIsReloading)
    {
      var semiCan = (m_fireType == WeaponFireType.SemiAuto && combatant.m_weaponTriggerJustPulled) || m_ammoBurstCounter > 0;
      if(semiCan)
      {
        return true;
      }
      else
      {
        return (m_fireType == WeaponFireType.Auto && combatant.m_weaponTriggerPulled) || m_ammoBurstCounter > 0;
      }
    }
  }
}

return false;
