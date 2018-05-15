/// @description PlayerGetStats_scr(playerInstance, attribute)
/// @param playerInstance
/// @param  attribute

var playerInstance = argument0;
var attr = argument1;

if(instance_exists(playerInstance))
{
  //Get the modifier map for damage
  var modFamily = attr;
  var modMap = 
    ModifiersGetCombatantNextShotModifiers_scr(playerInstance, modFamily);
    
  //Set attribute to a default value of 0
  var attrVal = 0;
  
  //Get the primary weapon
  var primaryWep = CombatantGetPrimaryWeapon_scr(playerInstance);
  
  var projType = undefined;
  if(instance_exists(primaryWep))
  {
    projType = WeaponGetNextProjectileType_scr(primaryWep);
  }
  
  //Get the base attribute value
  attrVal = WeaponGetProjectileAttribute_scr(primaryWep, projType, attr);
  if(is_undefined(attrVal)) attrVal = 0;
  
  var modPlus = modFamily;
  var modMult = modFamily + 1000;
  var modPlusDyn = modFamily + 2000;
  
  //Before getting the final attribute value, we must add 1 to the multiplier
  //modifier
  modMap[? modMult] += 1;
  
  var retVal = (attrVal + modMap[? modPlusDyn]) *
    modMap[? modMult] + modMap[? modPlus];

  ds_map_destroy(modMap);    
      
  return retVal;
}

