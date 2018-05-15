/// @description Draw self if this element has no parent
if(!instance_exists(m_containerElement) || !IsElementOverflown_scr(m_containerElement))
{
  FormsRunDrawScripts_scr(x, y);
}

var sufExists = surface_exists(m_contentOverflowSurface);
if(surface_exists(m_contentOverflowSurface))
{
  var boundaries = FormsGetEffectiveBoundaries_scr(id);
  var contX = FormsGetContainerX_scr(id);
  var contY = FormsGetContainerY_scr(id);
  //draw_surface(m_contentOverflowSurface, contX, contY);
  draw_surface_part(m_contentOverflowSurface, m_contentViewX, 
    m_contentViewY, boundaries[0] - contX + 1, boundaries[1] - contY + 1, contX, contY);
}


