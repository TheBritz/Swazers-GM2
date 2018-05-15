/// @description ModifiersIncrementInstanceModifier_scr(instance, modifierType, modifierVal)
/// @param instance
/// @param  modifierType
/// @param  modifierVal

var instance = argument0;
var modType = argument1;
var modVal = argument2;

//Create the modifiers map if it doesn't exist
if(is_undefined(instance.m_modifiers))
{
  instance_modifiers = ds_map_create();
}
var modMap = instance.m_modifiers;

//Set the modifier value to 0 if it doesn't exist yet
var modValCurr = modMap[? modType];
if(is_undefined(modValCurr))
{
  modValCurr = 0;
}

//Increment the modifier
modMap[? modType] = modValCurr + modVal;
