/// @description Execute AI states
if(CombatantAIContainsState_scr(id, AI_STATE_AGGRO))
{
  if(instance_exists(m_target))
  {
    m_moving = true;
    
    aimDir = point_direction(x, y, m_target.x, m_target.y);
    if(distance_to_object(m_target) > 250)
    {
      m_moveDir = aimDir;  
    }
    else if(distance_to_object(m_target) < 150)
    {
      m_moveDir = aimDir + 180;
    }
    else
    {
      m_moveDir = undefined;
      m_moving = false;
    }
    
    if(distance_to_object(m_target) < 400)
    {
      m_weaponTriggerPulled = true;
    } 
    else
    {
      m_weaponTriggerPulled = false;
    }
  }
  else
  {
    m_moving = false;
  }
}

///Ancestor Events
event_inherited();

///Ancestor Events
event_inherited();

