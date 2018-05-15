/// @description ModifiersIncrementCombatantProjectileClassModifier_scr(combatant, projectileClass, modifierType, modifierValue)
/// @param combatant
/// @param  projectileClass
/// @param  modifierType
/// @param  modifierValue

var combatant = argument0;
var projClass = argument1;
var modType = argument2;
var modVal = argument3;

with(combatant)
{
  var modMap = m_projectileClassModifiers[? projClass];
  if(is_undefined(modMap))
  {
    modMap = ds_map_create();
    m_projectileClassModifiers[? projClass] = modMap;
  }
  
  var modValCurr = modMap[? modType];
  if(is_undefined(modValCurr))
  {
    modValCurr = 0;
  }
  modMap[? modType] = modValCurr + modVal;
}
