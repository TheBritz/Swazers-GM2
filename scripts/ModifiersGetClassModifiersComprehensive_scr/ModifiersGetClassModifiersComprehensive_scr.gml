/// @description ModifiersGetClassModifiersComprehensive_scr(objectIndex, mod1...mod14)
/// @param objectIndex
/// @param  mod1...mod14

var objInd = argument[0];

//Get the starting point
var retMap = ds_map_create();
var modType;
for(var i = 1; i < argument_count; i++)
{
  modType = argument[i];
  retMap[? modType] = ModifiersGetClassModifier_scr(objInd, modType);
}

//Add in the inherited modifiers
var noParent = -100;
var parent = object_get_parent(objInd);
while(parent != noParent)
{
  for(var i = 1; i < argument_count; i++)
  {
    modType = argument[i];
    retMap[? modType] += ModifiersGetClassModifier_scr(parent, modType);
  }
  parent = object_get_parent(parent);
}

return retMap;
