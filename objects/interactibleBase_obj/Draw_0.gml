/// @description Draw base image
draw_sprite(sprite_index, image_index, x, y);

var highlighter;
for(var i = 0; i < ds_list_size(m_highlighterList); i++)
{
  highlighter = m_highlighterList[| i];
  draw_sprite_ext(m_spriteHighlight, image_index, x, y, image_xscale, image_yscale, 
    image_angle, highlighter.m_interactHighlightColor, image_alpha);
}

