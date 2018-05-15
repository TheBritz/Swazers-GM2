/// @description FormsSetContainerMargin_scr(element, margin [Margins enum], marginValue)
/// @param element
/// @param  margin [Margins enum]
/// @param  marginValue

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  var margin = argument1;
  var marginValue = argument2;
  with(element)
  {
    m_containerMargins[margin] = marginValue;
  }
}
