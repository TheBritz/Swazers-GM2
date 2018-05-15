/// @description FormsGetResizeTypes_scr(element, mouseX, mouseY)
/// @param element
/// @param  mouseX
/// @param  mouseY

var element = argument0;
var mouseX = argument1;
var mouseY = argument2;
var resizeTypes = array(WidthResizeTypes.None, HeightResizeTypes.None);

with(element)
{
  if(mouseY >= y - m_containerResizeThresh &&
     mouseY <= y + m_height + m_containerResizeThresh)
  {
    var diffLeft = mouseX - x;
    var diffRight = x + m_width - mouseX;
    if(abs(diffLeft) < m_containerResizeThresh)
    {
      resizeTypes[0] = WidthResizeTypes.Left;  
    }
    else if(abs(diffRight) < m_containerResizeThresh)
    {
      resizeTypes[0] = WidthResizeTypes.Right;    
    } 
  }

  if(mouseX >= x - m_containerResizeThresh &&
     mouseX <= x + m_width + m_containerResizeThresh)
  {
    var diffTop = mouseY - y;
    var diffBot = y + m_height - mouseY;
    if(abs(diffTop) < m_containerResizeThresh)
    {
      resizeTypes[1] = HeightResizeTypes.Top;  
    }
    else if(abs(diffBot) < m_containerResizeThresh)
    {
      resizeTypes[1] = HeightResizeTypes.Bottom;    
    } 
  }
}

return resizeTypes;
