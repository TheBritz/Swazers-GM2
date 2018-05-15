/// @description ModifiersGetInstanceModifier_scr(instance, modifier)
/// @param instance
/// @param  modifier

var instance = argument0;
var modifier = argument1;
var retVal = undefined;
if(!is_undefined(instance.m_modifiers))
{
  var retVal = instance.m_modifiers[? modifier];
}

if(is_undefined(retVal))
{
  retVal = 0;
}
return retVal;
