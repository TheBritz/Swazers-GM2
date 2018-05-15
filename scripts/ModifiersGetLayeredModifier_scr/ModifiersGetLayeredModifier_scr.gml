/// @description ModifiersGetLayeredModifier_scr(modifierMap, objectType, modifierType)
/// @param modifierMap
/// @param  objectType
/// @param  modifierType

var modifierMap = argument0;
var objInd = argument1;
var modType = argument2;
var retVal = undefined;

if(ds_map_exists(modifierMap, objInd))
{
  var modMap = modifierMap[? objInd];
  if(ds_map_exists(modMap, modType))
  {
    retVal = modMap[? modType];
  }
}

//Default return value is zero
if(is_undefined(retVal))
{
  retVal = 0;
}

return retVal;
