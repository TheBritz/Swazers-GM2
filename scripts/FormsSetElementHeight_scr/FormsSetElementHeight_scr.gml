/// @description FormsSetElementHeight_scr(element, height)
/// @param element
/// @param  height

var element = argument0;
var height = argument1;

if(IsLegalFormsElement_scr(element))
{
  element.m_height = height;
}
