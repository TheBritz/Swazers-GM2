/// @description Entity_MotionAdd_scr(entity, direction, speed)
/// @param entity
/// @param  direction
/// @param  speed

var entity = argument0;
var dir = argument1;
var spd = argument2;

with(entity)
{
  if(m_useRaw)
  {
    var speedTemp = speed;
    speed = m_speedRaw;
    motion_add(dir, spd);
    m_speedRaw = speed;
    speed = speedTemp;
  }
  else
  {
    motion_add(dir, spd);
  }
}
