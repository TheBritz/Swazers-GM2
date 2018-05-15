/// @description FormsSetElementPosition_scr(element, xPosition, yPosition)
/// @param element
/// @param  xPosition
/// @param  yPosition

var element = argument0;

if(IsLegalFormsElement_scr(element))
{
  var xPos = argument1; 
  var yPos = argument2;

  with(element)
  {
    if(!is_undefined(xPos)) m_xPos = xPos;     
    if(!is_undefined(yPos)) m_yPos = yPos;
  }
}
