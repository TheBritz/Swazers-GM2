/// @description Entity_SetSpeed_scr(entity, speedType, speed)
/// @param entity
/// @param  speedType
/// @param  speed

enum SpeedType
{
  H,
  V,
  Abs
}

var entity = argument0;
var spdType = argument1;
var spd = argument2;

if(spdType == SpeedType.Abs)
{
  if(entity.m_useRaw)
  {
    entity.m_speedRaw = spd;
  }
  else
  {
    entity.speed = spd;
  } 
}
else if(spdType == SpeedType.H)
{
  if(entity.m_useRaw)
  {
    entity.m_speedHorRaw = spd;
  }
  else
  {
    entity.hspeed = spd;
  }
}
else if(spdType == SpeedType.V)
{
  if(entity.m_useRaw)
  {
    entity.m_speedVertRaw = spd;
  }
  else
  {
    entity.vspeed = spd;
  } 
}
