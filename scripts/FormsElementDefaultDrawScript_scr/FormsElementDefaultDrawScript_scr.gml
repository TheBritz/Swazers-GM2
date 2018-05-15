/// @description FormsElementDefaultDrawScript_scr(x, y)
/// @param x
/// @param  y

var X = argument0;
var Y = argument1;

var alpha = draw_get_alpha();
var color = draw_get_color();

if(!is_undefined(m_colorBackground))
{
  draw_set_color(m_colorBackground);
  draw_set_alpha(m_alphaBackground);
  draw_rectangle(X, Y, X + m_width, Y + m_height, false);
}

if(!is_undefined(m_colorContainer))
{
  draw_set_color(m_colorContainer);
  draw_set_alpha(m_alphaContainer);
  var marginLeft = FormsGetContainerMargin_scr(id, Margins.Left);
  var marginTop = FormsGetContainerMargin_scr(id, Margins.Top );
  var contWidth = FormsGetContainerWidth_scr(id);
  var contHeight = FormsGetContainerHeight_scr(id);
  
  draw_rectangle(X + marginLeft, Y + marginTop, X + marginLeft + contWidth, Y + marginTop + contHeight, false);
}

if(!is_undefined(m_colorOutline))
{
  draw_set_color(m_colorOutline);
  draw_set_alpha(m_alphaOutline);
  draw_rectangle_by_lines(X, Y, X + m_width, Y + m_height, m_colorOutline);
  //draw_rectangle(X, Y, X + m_width, Y + m_height, true);
}

//Reset Color
draw_set_alpha(alpha);
draw_set_color(color);
