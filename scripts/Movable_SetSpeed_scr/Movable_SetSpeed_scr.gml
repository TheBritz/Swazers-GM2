/// @description Movable_SetSpeed_scr(movable, speed)
/// @param movable
/// @param  speed

var movable = argument0;
var spd = argument1;

with(movable)
{
  m_speed = spd;
  m_speedX = 0;
  m_speedY = 0;
}
