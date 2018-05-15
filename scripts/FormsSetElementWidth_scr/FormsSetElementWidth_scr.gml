/// @description FormsSetElementWidth_scr(element, width)
/// @param element
/// @param  width

var element = argument0;
var width = argument1;

if(IsLegalFormsElement_scr(element))
{
  element.m_width = width;
}
