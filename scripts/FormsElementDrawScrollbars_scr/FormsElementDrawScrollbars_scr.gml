var X = argument0;
var Y = argument1;

var color = draw_get_color();

var drawScrollbarHor = m_contentIsOverflowHor && m_scrollbarHorEnabled;
var drawScrollbarVert = m_contentIsOverflowVert && m_scrollbarVertEnabled;

var scrollbarVertHeight = m_height;
var scrollbarHorWidth = m_width;
if(drawScrollbarHor && drawScrollbarVert)
{
  //Adjust scrollbar width and height if both are active
  scrollbarVertHeight -= m_scrollbarHorHeight;
}

if(m_contentIsOverflowVert && m_scrollbarVertEnabled)
{
  //Draw vertical scrollbar background
  var xx = X + m_width - m_scrollbarVertWidth - 1;
  var yy = Y + 1;
  draw_set_color(m_colorScrollbarBackgroundVert);
  draw_rectangle(xx, yy, X + m_width - 1, Y + scrollbarVertHeight -1, false);
  
  //Draw vertical scrollbar arrow buttons
  draw_set_color(m_colorScrollbarArrowsBackgroundVert);
  draw_rectangle(xx, yy, X + m_width - 1, Y + m_scrollbarVertWidth - 1, false);
  draw_rectangle(xx, Y + scrollbarVertHeight - m_scrollbarVertWidth - 1, X + m_width - 1, Y + scrollbarVertHeight - 1, false); 
  draw_set_color(m_colorScrollbarArrowsDisabledVert);
  draw_sprite_ext(FormsScrollArrowUp_spr, 0, xx + ceil(m_scrollbarVertWidth/2), yy + ceil(m_scrollbarVertWidth/2), 1, 1, 0, c_gray, 1);
  draw_sprite_ext(FormsScrollArrowDown_spr, 0, xx + ceil(m_scrollbarVertWidth/2), Y + scrollbarVertHeight - ceil(m_scrollbarVertWidth/2), 1, 1, 0, c_gray, 1);  
}

draw_set_color(color);
