/// @description FormsSetAllContainerMargins_scr(element, leftMargin, rightMargin, topMargin, bottomMargin)
/// @param element
/// @param  leftMargin
/// @param  rightMargin
/// @param  topMargin
/// @param  bottomMargin

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  var margins;
  margins[0] = argument1;
  margins[1] = argument2;
  margins[2] = argument3;
  margins[3] = argument4;
  
  with(element)
  {
    var margin;
    for(var i = 0; i < array_length_1d(margins); i++)
    {
      margin = margins[i];
      if(!is_undefined(margin)) m_containerMargins[i] = margin;
    }   
  }
}
