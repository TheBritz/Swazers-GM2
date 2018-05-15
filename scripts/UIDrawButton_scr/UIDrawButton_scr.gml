/// @description UIDrawButton_scr(argArray)
/// @param argArray

var surfDraw = argument0;
var argArray = argument1;

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(my_font);

var drawL, drawR, drawU, drawD, drawTextX, drawTextY;
if(surfDraw)
{
  drawL = 0;
  drawR = borderR - borderL;
  drawU = 0;
  drawD = borderD - borderU - 1;
  drawTextX = x - borderL - 1;
  drawTextY = y - borderU;
}
else
{
  drawL = borderL;
  drawR = borderR;
  drawU = borderU;
  drawD = borderD;
  drawTextX = x;
  drawTextY = y;
}

draw_rectangle_colour(drawL + 1, drawU + 1, drawR - 2, drawD - 2, 
  my_color, my_color, my_color, my_color, unselected);
draw_text_transformed_colour(drawTextX, drawTextY, string_hash_to_newline(text), scale, scale, 
  0, text_color, text_color, text_color, text_color, 1);

