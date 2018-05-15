/// @description ModifiersSetInstanceModifier_scr(instance, modifier, modifierVal)
/// @param instance
/// @param  modifier
/// @param  modifierVal

var instance = argument0;
var modifier = argument1;
var modVal = argument2;

if(is_undefined(instance.m_modifiers))
{
  instance.m_modifiers = ds_map_create();
}

instance.m_modifiers[? modifier] = modVal;

