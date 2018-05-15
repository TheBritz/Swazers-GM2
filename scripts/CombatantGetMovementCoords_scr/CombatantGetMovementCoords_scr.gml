/// @description CombatantGetMovementCoords_scr(combatant)
/// @param combatant

var combatant = argument0;
if(object_is(combatant.object_index, entityCombatant_obj))
{
  with(combatant)
  {
    if(!is_undefined(movementMask))
    {
      if(is_undefined(m_movementCoords))
      {
        var maskWidth = sprite_get_bbox_right(movementMask) - 
          sprite_get_bbox_left(movementMask);
        m_movementCoords[0] = sprite_get_bbox_left(movementMask) + maskWidth/2;
        m_movementCoords[0] = m_movementCoords[0] - sprite_get_xoffset(movementMask);
        var maskHeight = sprite_get_bbox_bottom(movementMask) - sprite_get_bbox_top(movementMask);
        m_movementCoords[1] = sprite_get_bbox_top(movementMask) + maskHeight/2;
        m_movementCoords[1] = m_movementCoords[1] - sprite_get_yoffset(movementMask);
      }
    }
    
    return m_movementCoords;  
  }
}
