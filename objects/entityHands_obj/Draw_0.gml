var handPos;
for(var i = 0; i < ds_list_size(m_handPositions); i++)
{
  if(i < array_length_1d(m_hands))
  {
    handPos = m_handPositions[|i];
    draw_sprite_ext(m_hands[0], image_index, handPos[0], handPos[1], 
      image_xscale, image_yscale, image_angle, -1, image_alpha);
  }
}

