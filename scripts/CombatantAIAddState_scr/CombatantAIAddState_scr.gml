/// @description CombatantAIAddState_scr(combatant, state1, state2...)
/// @param combatant
/// @param  state1
/// @param  state2...

var combatant = argument[0];

with(combatant)
{
  for(var i = 1; i < argument_count; i++)
  {
    ds_list_add(aiStateList, argument[i]); 
  }
}
