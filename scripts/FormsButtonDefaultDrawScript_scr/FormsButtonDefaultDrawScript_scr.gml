/// @description FormsButtonDefaultDrawScript_scr(x, y)
/// @param x
/// @param  y

var X = argument0;
var Y = argument1;

//Draw Text
var tempX = x;
var tempY = y;
x = X;       
y = Y;
var centerX = FormsGetContainerCenterHor_scr(id);
var centerY = FormsGetContainerCenterVert_scr(id);
x = tempX;
y = tempY;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_colour(centerX, centerY, string_hash_to_newline(m_text), m_colorText, m_colorText, m_colorText, m_colorText, m_alphaText);
