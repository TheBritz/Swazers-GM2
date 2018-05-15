if(!is_undefined(sprite_index) && sprite_index != null_spr)
{
  draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,direction,c_cursor[0],1);
}
else
{
  var cursorCoords1 = cursorCoords[0];
  var cursorCoords2 = cursorCoords[1];
  draw_triangle_colour(x, y, x + cursorCoords1[0], y + cursorCoords1[1], x + cursorCoords2[0], y + cursorCoords2[1], c_cursor[0], c_cursor[1], c_cursor[2], c_outline);
}

