/// @description ControlsReadReload_scr(isButtonPressed)
/// @param isButtonPressed

var btnPressed = argument0;
if(btnPressed && ds_list_size(m_weaponsActive) > 0)
{
  var wep = m_weaponsActive[|0];
  if(!wep.m_ammoIsReloading && ds_list_size(wep.ammoClip) < WeaponGetClipCapacity_scr(wep))
  {
    WeaponInitiateReload_scr(wep);
  }
}
