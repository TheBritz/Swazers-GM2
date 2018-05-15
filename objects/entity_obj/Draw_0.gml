/// @description Draw this entity

//Draw shadow
if(m_drawShadow && !is_undefined(m_shadowCoords1) && !is_undefined(m_shadowCoords2))
{
  draw_set_alpha(m_shadowAlpha);
  draw_ellipse_colour(m_shadowCoords1[0], m_shadowCoords1[1],
    m_shadowCoords2[0], m_shadowCoords2[1], c_black, c_black, false);
  draw_set_alpha(1);
}

if(!is_undefined(sprite_index))
{
  //Adjust y for z
  var tempY = y;
  y += m_z * m_zCoef;
  draw_self();
  y = tempY;
}

