/// @description Entity_AddToSpeed_scr(entity, speedType, speedToAdd)
/// @param entity
/// @param  speedType
/// @param  speedToAdd

var entity = argument0;
var spdType = argument1;
var spd = argument2;

if(spdType == SpeedType.Abs)
{
  entity.speed += spd;
  entity.m_speedRaw += spd;
}
else if(spdType == SpeedType.H)
{
  entity.hspeed += spd;
  entity.m_speedHorRaw += spd;
}
else if(spdType == SpeedType.V)
{
  entity.vspeed += spd;
  entity.m_speedVertRaw += spd;
}
