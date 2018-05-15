/// @description FormsGetContainerHeight_scr(element)
/// @param element

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  with(element)
  {
    var marginT = 0;
    var marginB = 0;
    if(!is_undefined(m_containerMargins[Margins.Top]))
    {
      marginT = m_containerMargins[Margins.Top];
    }
    if(!is_undefined(m_containerMargins[Margins.Bottom]))
    {
      marginB = FormsGetContainerMargin_scr(id, Margins.Bottom);
    }
    return m_height - marginT - marginB;
  }
}
