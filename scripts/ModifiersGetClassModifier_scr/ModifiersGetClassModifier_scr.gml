/// @description ModifiersGetClassModifier_scr(objectType, modifier)
/// @param objectType
/// @param  modifier
//Gets the specified modifier for the specified object type. If no such 
//modifier exists, 0 is returned.

var objInd = argument0;
var modifier = argument1;

return ModifiersGetLayeredModifier_scr(global.ClassModifierMap, objInd, modifier);
