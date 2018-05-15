/// @description FormsGetElementWidth_scr(element)
/// @param element

var element = argument0;

if(IsLegalFormsElement_scr(element))
{
  return element.m_width;
}
