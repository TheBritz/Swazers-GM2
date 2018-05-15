/// @description Entity_GetMaskMidpoint_scr(entity)
/// @param entity

var entity = argument0;
if(object_is(entity.object_index, entity_obj))
{
  with(entity)
  {
    if(!is_undefined(sprite_index))
    {
      if(is_undefined(m_maskMidpointCoords))
      {
        var maskWidth = sprite_get_bbox_right(sprite_index) - 
          sprite_get_bbox_left(sprite_index);
        m_maskMidpointCoords[0] = sprite_get_bbox_left(sprite_index) + maskWidth/2;
        m_maskMidpointCoords[0] = m_maskMidpointCoords[0] - sprite_get_xoffset(sprite_index);
        var maskHeight = sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index);
        m_maskMidpointCoords[1] = sprite_get_bbox_top(sprite_index) + maskHeight/2;
        m_maskMidpointCoords[1] = m_maskMidpointCoords[1] - sprite_get_yoffset(sprite_index);
      }
    }
    
    return m_maskMidpointCoords;  
  }
}
