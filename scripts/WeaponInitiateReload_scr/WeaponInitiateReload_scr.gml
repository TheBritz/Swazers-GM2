/// @description WeaponInitiateReload_scr(weaponInstance)
/// @param weaponInstance

var wep = argument0;

with(wep)
{
  wep.m_ammoIsReloading = true;
  wep.ammoReloadTimer = WeaponGetReloadRate_scr(wep);
  wep.m_ammoBurstCounter = 0;
  EntityEventFire_scr(id, EVENTS_RELOAD_START);
}
