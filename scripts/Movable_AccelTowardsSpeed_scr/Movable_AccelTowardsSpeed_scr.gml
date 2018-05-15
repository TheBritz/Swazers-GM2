/// @description Movable_AccelTowardsSpeed_scr(movable, speed, accel)
/// @param movable
/// @param  speed
/// @param  accel

var movable = argument0;
var spd = argument1;
var acc = argument2;

with(movable)
{
  var spdDiff = spd - m_speed;
  var spdDir = sign(spdDiff);
  m_speed += acc * spdDir;
  
  if(abs(m_speed) > abs(spd) && sign(m_speed) == sign(spd))
  {
    //Don't go above the speed specified
    m_speed = spd;
  }
}
