/// @description UILabelDraw_scr(isDrawnToSurface, argArray)
/// @param isDrawnToSurface
/// @param  argArray

var surfDraw = argument0;
var argArray = argument1;

var drawL, drawR, drawU, drawD, drawTextX, drawTextY;
if(surfDraw)
{
  drawL = 0;
  drawR = container_w;
  drawU = 0;
  drawD = container_h - 1;
  drawTextX = x - borderL;
  drawTextY = y - borderU - 1;
  draw_point_colour(drawL, drawD - 1, rectColor[2]);
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

if(drawRect)
{
  draw_rectangle_colour(drawL + 1, drawU + 1, drawR - 2, drawD - 2, 
    rectColor[0], rectColor[1], rectColor[2], rectColor[3], drawOutline);
  draw_point_colour(drawL, drawU, rectColor[0]);
  //draw_set_colour(rectColor[0]);
  //draw_rectangle(drawL, drawU, drawR, drawD, drawOutline);
}

draw_set_valign(labelAlignV);
draw_set_halign(labelAlignH);
draw_text_transformed_colour(drawTextX, drawTextY, string_hash_to_newline(text), labelScaleH, labelScaleV, image_angle,
  textColor[0], textColor[1], textColor[2], textColor[3], image_alpha);


