/// @description ModifiersGetCombatantNextShotModifiers_scr(playerInstance, modifierFamily)
/// @param playerInstance
/// @param  modifierFamily

//Getting the modifier values for a combatant's next shot is more complicated
//than getting just the modifiers that apply to that particular combatant. Each
//shot from a weapon is effected by the combatant, weapon, and projectile
//with each part getting modifiers from different places. This script is meant
//to simplify retrieval of these modifiers.

/*
-Modifier Sources-

Combatant:
  1. Class modifier
  2. Instance modifier
  3. Combatant Projectile Instance modifier
  4. Combatant Weapon Instance modifier
  
Weapon:
  1. Class modifier
  2. Instance modifier
  
Projectile:
  1. Class modifier
*/

var playerInstance = argument0;
var modifierFamily = argument1;

var modPlus = modifierFamily;
var modMult = modifierFamily + 1000;
var modPlusDyn = modifierFamily + 2000;

var retMap = undefined;
if(instance_exists(playerInstance))
{
  with(playerInstance)
  {
    //Get the list of class modifiers for the player
    retMap = ModifiersGetClassModifiersComprehensive_scr
      (object_index, modPlus, modMult, modPlusDyn); 
    
    //Include the modifiers for the specific player instance
    retMap[? modMult] += 
      ModifiersGetInstanceModifier_scr(id, modMult);
    retMap[? modPlus] += 
      ModifiersGetInstanceModifier_scr(id, modPlus);
    retMap[?modPlusDyn] += 
      ModifiersGetInstanceModifier_scr(id, modPlusDyn);
      
    //Get the primary weapon instance
    var primaryWep = CombatantGetPrimaryWeapon_scr(id);
    
    if(instance_exists(primaryWep))
    {
      //Include the modifiers for the weapon class
      modifiers = ModifiersGetClassModifiersComprehensive_scr(primaryWep.object_index,
        modMult, modPlus, modPlusDyn);
      retMap[? modMult] += modifiers[? modMult];
      retMap[? modPlus] += modifiers[? modPlus];
      retMap[? modPlusDyn] += modifiers[? modPlusDyn];
      //Clean up the modifiers map
      ds_map_destroy(modifiers);
      
      //Include the modifiers on the weapon instance
      retMap[? modMult] += ModifiersGetInstanceModifier_scr(primaryWep, modMult);
      retMap[? modPlus] += ModifiersGetInstanceModifier_scr(primaryWep, modPlus);
      retMap[? modPlusDyn] += ModifiersGetInstanceModifier_scr(primaryWep, modPlusDyn);
      
      //Get the next projectile type for this weapon
      var projType = WeaponGetNextProjectileType_scr(primaryWep);
      
      //Include the modifiers for the projectile class
      modifiers = ModifiersGetClassModifiersComprehensive_scr(projType,
        modMult, modPlus, modPlusDyn);
      retMap[? modMult] += modifiers[? modMult];
      retMap[? modPlus] += modifiers[? modPlus];
      retMap[? modPlusDyn] += modifiers[? modPlusDyn];
      //Clean up the modifiers map
      ds_map_destroy(modifiers);
      
      //Include the combatant-specific projectile class modifiers
      modifiers = ModifiersGetCombatantProjectileClassModifierComprehensive_scr
        (playerInstance, projType, modMult, modPlus, modPlusDyn);
      retMap[? modMult] += modifiers[? modMult];
      retMap[? modPlus] += modifiers[? modPlus];
      retMap[? modPlusDyn] += modifiers[? modPlusDyn];
      //Clean up the modifiers map
      ds_map_destroy(modifiers);
      
      //Include the combatant-specific weapon class modifiers
      modifiers = ModifiersGetCombatantWeaponClassModifierComprehensive_scr
        (playerInstance, primaryWep.object_index, modMult, modPlus, modPlusDyn);
      retMap[? modMult] += modifiers[? modMult];
      retMap[? modPlus] += modifiers[? modPlus];
      retMap[? modPlusDyn] += modifiers[? modPlusDyn];
      //Clean up the modifiers map
      ds_map_destroy(modifiers);
    }
  }
}

return retMap;
