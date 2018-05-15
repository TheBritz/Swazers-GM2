/// @description Draw Glow
if(!is_undefined(m_glowSprite))
{
  draw_sprite_ext(m_glowSprite, image_index, x, y, image_xscale, 
    image_yscale, image_angle, m_glowColor, image_alpha);
}

if(!is_undefined(m_impactPosX) && !is_undefined(m_impactPosY))
{
  draw_sprite_ext(m_impactGlowSpite, image_index, m_impactPosX, 
    m_impactPosY, 1, 1, image_angle, m_glowColor, image_alpha);
}

///Ancestor Events
event_inherited();

