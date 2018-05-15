/// @description Movable_UnsetBuiltInSpeedProperties_scr(movable)
/// @param movable

var movable = argument0;

with(movable)
{
  m_speed = speed;
  m_direction = direction;
  speed = 0;
  direction = 0;  
}
