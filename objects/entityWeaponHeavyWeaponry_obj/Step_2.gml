/// @description Ancestor Events
event_inherited();

///Combatant speed adjustment

if(instance_exists(combatant) && combatant.m_weaponTriggerPulled && !m_ammoIsReloading)
{
  combatant.speedMaxModMult = .5;
}
else
{
  combatant.speedMaxModMult = 1;
}

