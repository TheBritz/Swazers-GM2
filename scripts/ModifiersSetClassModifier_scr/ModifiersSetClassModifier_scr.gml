/// @description ModifiersSetClassModifier_scr(objectIndex, modifierType, modifierVal)
/// @param objectIndex
/// @param  modifierType
/// @param  modifierVal

var objInd = argument0;
var modType = argument1;
var modVal = argument2;

var modMap = global.ClassModifierMap[? objInd];
if(is_undefined(modMap))
{
  modMap = ds_map_create();
  global.ClassModifierMap[? objInd] = modMap;
}

modMap[? modifierType] = modVal;
