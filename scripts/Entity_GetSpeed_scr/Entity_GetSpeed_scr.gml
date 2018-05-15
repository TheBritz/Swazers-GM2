/// @description Entity_GetSpeed_scr(entity)
/// @param entity

var entity = argument0;

if(entity.m_useRaw)
{
  return entity.m_speedRaw;
}
else
{
  return entity.speed;
}
