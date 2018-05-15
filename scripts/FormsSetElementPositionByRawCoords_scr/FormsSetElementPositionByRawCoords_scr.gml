/// @description FormsSetElementPositionByRawCoords_scr(element, x, y)
/// @param element
/// @param  x
/// @param  y

var element = argument0;
var X = argument1;
var Y = argument2;

with(element)
{
  if(!is_undefined(X))
  {
    x = X;
    if(m_xPosType == DimensionTypes.Absolute)
    {
      m_xPos = X;
    }
    else if(m_xPosType == DimensionTypes.Relative)
    {
      m_xPos = X / __view_get( e__VW.WView, 0 );
    }
  }
  
  if(!is_undefined(Y))
  {
    y = Y;
    if(m_yPosType == DimensionTypes.Absolute)
    {
      m_yPos = Y;
    }
    else if(m_yPosType == DimensionTypes.Relative)
    {
      m_yPos = Y / __view_get( e__VW.HView, 0 );
    }
  }
}
