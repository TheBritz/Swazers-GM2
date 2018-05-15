/// @description CombatantAIAddStateExclusive_scr(combatant, state1, state2...)
/// @param combatant
/// @param  state1
/// @param  state2...

var combatant = argument[0];
ds_list_clear(combatant.aiStateList);

for(var i = 1; i < argument_count; i++)
{
  CombatantAIAddState_scr(combatant, argument[1]);
}
