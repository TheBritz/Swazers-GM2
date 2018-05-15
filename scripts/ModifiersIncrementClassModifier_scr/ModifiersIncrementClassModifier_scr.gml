/// @description ModifiersIncrementClassModifier_scr(objectIndex, modifierType, modifierVal)
/// @param objectIndex
/// @param  modifierType
/// @param  modifierVal

var objInd = argument0;
var modType = argument1;
var modVal = argument2;

//Check to see if the modifier map exists and create it if it doesn't
var modMap = global.ClassModifierMap[? objInd];
if(is_undefined(modMap))
{
  modMap = ds_map_create();
  global.ClassModifierMap[? objInd] = modMap;
}

//Check to see if this modifier entry exists - set to 0 if it doesn't
var modValCurr = modMap[? modType];
if(is_undefined(modValCurr))
{
  modValCurr = 0;
}

//Set the modifier value
modMap[? modType] = modValCurr + modVal;
