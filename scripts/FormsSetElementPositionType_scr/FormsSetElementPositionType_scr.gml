/// @description FormsSetElementPositionType_scr(element, xPositionType [DimensionType enum], yPositionType [DimensionType enum])
/// @param element
/// @param  xPositionType [DimensionType enum]
/// @param  yPositionType [DimensionType enum]

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  var xPosType = argument1;
  var yPosType = argument2;
  with(element)
  {
    if(!is_undefined(xPosType)) m_xPosType = xPosType;
    if(!is_undefined(yPosType)) m_yPosType = yPosType;
  }
}
