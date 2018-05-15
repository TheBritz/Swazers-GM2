/// @description EntityGetGravity_scr(entity [optional])
/// @param entity [optional]

var entity = id;
if(argument_count > 0)
{
  entity = argument[0];
}

if(instance_exists(entity) && !is_undefined(entity.m_gravity))
{
  return entity.m_gravity;
}
else
{
  var grav = global.Gravity;
  return grav;
}

