/// @description FormsGetContainerY_scr(element)
/// @param element

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  with(element)
  {
    var marginTop = 0;
    if(!is_undefined(m_containerMargins[Margins.Top])) 
    {
      marginTop = m_containerMargins[Margins.Top];
    }
    return y + marginTop;
  }
}
