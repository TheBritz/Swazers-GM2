/// @description Ancestor Events

///Combatant Collision
var combatantList = instance_place_list(x, y, entityCombatant_obj, 1000);
//Add the combatant shadows to the list
instance_place_list(x, y, entityCombatantShadow_obj, 1000, combatantList);

var combatant, pushDirection;
for(var i = 0; i < ds_list_size(combatantList); i++)
{
  combatant = combatantList[|i];
  pushDirection = point_direction(x, y, combatant.x, combatant.y);
  with(combatant)
  {
    motion_add(pushDirection, m_pushAccel);
  }
}



