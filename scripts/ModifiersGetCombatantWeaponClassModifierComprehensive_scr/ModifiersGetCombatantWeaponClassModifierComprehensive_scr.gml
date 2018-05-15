/// @description ModifiersGetCombatantWeaponClassModifierComprehensive_scr(combatant, objectType, mod1...mod13)
/// @param combatant
/// @param  objectType
/// @param  mod1...mod13

var combatant = argument[0];
var objInd = argument[1];

var modArray;
for(var i = 2; i < argument_count; i++)
{
  modArray[i - 2] = argument[i];
}

return ModifiersGetLayeredModifiersComprehensive_scr(combatant.m_weaponClassModifiers, objInd, modArray);
