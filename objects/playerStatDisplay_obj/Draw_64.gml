/// @description Draw stat display

if(m_visible)
{
  var statArr, statIcon, statValue, drawStartCoords, X, Y, textX;
  drawStartCoords = m_drawCoordsMap[? m_playerInstance.m_playerIndex];
  X = drawStartCoords[0];
  Y = drawStartCoords[1];
  textX = X + m_textSeparation;
  
  for(var i = 0; i < ds_list_size(m_cacheList); i++)
  {
    statArr = m_cacheList[| i];
    statIcon = statArr[0];
    statValue = statArr[1];
    draw_sprite(statIcon, 0, X, Y);
    draw_set_font(m_font);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_left);
    draw_text_colour(textX, Y, string_hash_to_newline(string(statValue)), c_white, c_white, c_white, c_white, 1);
    Y += 20;     
  }
}

