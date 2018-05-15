/// @description Monitor Mouse Position
m_mouseMoved = false;
var mouseX = window_mouse_get_x();
var mouseY = window_mouse_get_y();

if(mouseX != m_mouseX || mouseY != m_mouseY)
{
  m_mouseMoved = true;
}

m_mouseX = mouseX;
m_mouseY = mouseY;

