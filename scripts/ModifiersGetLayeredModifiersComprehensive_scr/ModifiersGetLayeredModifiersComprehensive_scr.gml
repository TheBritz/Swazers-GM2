/// @description ModifiersGetLayeredModifiersComprehensive_scr(modifierMap, objectIndex, modArray)
/// @param modifierMap
/// @param  objectIndex
/// @param  modArray

var modifierMap = argument[0];
var objInd = argument[1];
var modArray = argument[2];

//Get the starting point
var retMap = ds_map_create();
var modType;
for(var i = 0; i < array_length_1d(modArray); i++)
{
  modType = modArray[i];
  retMap[? modType] = ModifiersGetLayeredModifier_scr(modifierMap, objInd, modType);
}

//Add in the inherited modifiers
var noParent = -100;
var parent = object_get_parent(objInd);
while(parent != noParent)
{
  for(var i = 0; i < array_length_1d(modArray); i++)
  {
    modType = modArray[i];
    retMap[? modType] += ModifiersGetLayeredModifier_scr(modifierMap, parent, modType);
  }
  parent = object_get_parent(parent);
}

return retMap;
