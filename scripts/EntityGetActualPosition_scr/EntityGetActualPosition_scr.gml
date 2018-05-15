/// @description EntityGetActualPosition_scr(entityInstance)
/// @param entityInstance

//This script returns the position of the entity, taking z into account. The
//returned value is a coordinate array.

var entity = argument0;

with(entity)
{
  var posX = x;
  var posY = y + m_z;
  
  return array(posX, posY);
}
