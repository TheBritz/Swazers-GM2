/// @description FormsSetContainerWidth_scr(element, containerWidth)
/// @param element
/// @param  containerWidth

var element = argument0;

if(IsLegalFormsElement_scr(element))
{
  var containerWidth = argument1;
  with(element)
  {
    m_width = containerWidth + 
      FormsGetContainerMargin_scr(element, Margins.Left) + 
      FormsGetContainerMargin_scr(element, Margins.Right);
  }
}
