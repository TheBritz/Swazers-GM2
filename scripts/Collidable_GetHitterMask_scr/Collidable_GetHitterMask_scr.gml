/// @description Collidable_GetHitterMask_scr(collidable)
/// @param collidable

var collidable = argument0;

if(!is_undefined(m_hitterMask))
{
  return m_hitterMask;
}
else if(mask_index != -1)
{
  return mask_index;
}
else
{
  return sprite_index;
}

