/// @description FormsGetContainerWidth_scr(element)
/// @param element

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  with(element)
  {
    var marginL = 0;
    var marginR = 0;
    if(!is_undefined(m_containerMargins[Margins.Left]))
    {
      marginL = m_containerMargins[Margins.Left];
    }
    if(!is_undefined(m_containerMargins[Margins.Right]))
    {
      marginR = FormsGetContainerMargin_scr(id, Margins.Right);
    }
    return m_width - marginL - marginR;
  }
}
