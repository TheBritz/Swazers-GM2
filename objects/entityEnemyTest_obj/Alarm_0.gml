/// @description Perform Player proximity test

var playerInstance = instance_nearest(x, y, playerBase_obj);
if(instance_exists(playerInstance))
{
  if(distance_to_object(playerInstance) < aiActivateDist)
  {
    m_target = playerInstance;
    CombatantAIAddStateExclusive_scr(id, AI_STATE_AGGRO);
  }
} 

alarm[0] = aiActivateCheckTime;

