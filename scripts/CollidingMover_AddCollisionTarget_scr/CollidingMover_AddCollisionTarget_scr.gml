/// @description CollidingMover_AddCollisionTarget_scr(collidingMover, collideeType, script, treatAsSolid, insertPosition [optional])
/// @param collidingMover
/// @param  collideeType
/// @param  script
/// @param  treatAsSolid
/// @param  insertPosition [optional]

var i = 0;

var collMover = argument[i++];
var collType = argument[i++];
var script = argument[i++];
var treatAsSolid = argument[i++];
var insPos = -1;
if(argument_count > i)
{
  var insPos = argument[i++];
}

if(!ds_exists(m_colliderTargetScriptMap, ds_type_map))
{
  m_colliderTargetScriptMap = ds_map_create();
  m_colliderTreatAsSolidMap = ds_map_create();
  m_colliderTargetList = ds_list_create();
}

//Add the target/script pair to the map
m_colliderTargetScriptMap[? collType] = script;
m_colliderTreatAsSolidMap[? collType] = treatAsSolid;

//Add the target to the list
if(insPos > -1 && insPos < ds_list_size(m_colliderTargetList))
{
  m_colliderTargetList[| insPos] = collType;
}
else
{
  ds_list_add(m_colliderTargetList, collType); 
}

