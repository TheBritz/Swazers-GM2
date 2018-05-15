/// @description WeaponGetNextProjectileType_scr(weaponInstance)
/// @param weaponInstance
//Returns the object_index of the next projectile to be fired

var wep = argument0;

with(wep)
{
  var clipIndex = WeaponGetClipIndex_scr(id);
  if(clipIndex >= 0)
  {
    var projType = ammoClip[| clipIndex];
    m_ammoLastProjType = projType;
  }
  else
  {
    projType = m_ammoLastProjType;
  }
  
  return projType;
}
