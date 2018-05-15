/// @description FormsConfigureMask_scr(element)
/// @param element

var element = argument0;
var maskWidth, maskHeight;
with(element)
{
  maskWidth = m_width;
  maskHeight = m_height;
  
  if(instance_exists(m_containerElement) && 
     IsElementOverflown_scr(m_containerElement))
  {
    if(m_containerElement.m_contentIsOverflowVert)
    {
      var contWidth = FormsGetContainerWidth_scr(m_containerElement);
      var contX = FormsGetContainerX_scr(m_containerElement);
      var boundaryRight = contX + contWidth;
      maskWidth = boundaryRight - x;
    }
    
    if(m_containerElement.m_contentIsOverflowHor)
    {
      var contHeight = FormsGetContainerHeight_scr(m_containerElement);
      var contY = FormsGetContainerY_scr(m_containerElement);
      var boundaryBottom = contY + contHeight;
      maskHeight = boundaryBottom - y;
    }    
  }
  
  image_xscale = maskWidth / sprite_get_width(mask_index);
  image_yscale = maskHeight / sprite_get_height(mask_index);
  
  //sprite_collision_mask
      //(m_collisionSprite, false, 2, 0, 0, maskWidth, maskHeight, 1, 255);
  //mask_index = m_collisionSprite;
}
