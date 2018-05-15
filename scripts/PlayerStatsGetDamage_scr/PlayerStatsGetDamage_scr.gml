/// @description PlayerStatsGetDamage_scr(playerInstance)
/// @param playerInstance

var playerInstance = argument0;

if(instance_exists(playerInstance))
{
  //Get the modifier map for damage
  var modMap = ModifiersGetCombatantNextShotModifiers_scr(playerInstance, MODIFIER_DMG);

  //Set damage to a starting value of 0
  var damage = 0;  
  
  //Get the primary weapon
  var primaryWep = CombatantGetPrimaryWeapon_scr(playerInstance);
  
  var projType = undefined;
  if(instance_exists(primaryWep))
  {
    projType = WeaponGetNextProjectileType_scr(primaryWep);
  }
  
  //Get the base damage value
  damage = WeaponGetProjectileAttribute_scr(primaryWep, projType, PROJ_ATTR_DMG);
  if(is_undefined(damage)) damage = 0;
  
  //Before getting the final damage we must add 1 to the multiplier modifier
  modMap[? MODIFIER_DMG_MULT] += 1;
  
  var retVal = (damage + modMap[? MODIFIER_DMG_PLUS_DYN]) *
    modMap[? MODIFIER_DMG_MULT] + modMap[? MODIFIER_DMG_PLUS];
  ds_map_destroy(modMap);
  return retVal;
}
else
{
  return 0;
}
