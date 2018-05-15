/// @description CombatantAIContainsState_scr(combatant, state)
/// @param combatant
/// @param  state

var combatant = argument0;
var state = argument1;

with(combatant)
{
  var thisState;
  for(var i = 0; i < ds_list_size(aiStateList); i++)
  {
    thisState = aiStateList[|i]; 
    if(thisState == state)
    {
      return true;
      exit;
    }
  }
}

return false;
