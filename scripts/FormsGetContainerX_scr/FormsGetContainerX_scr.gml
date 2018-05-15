/// @description FormsGetContainerX_scr(element)
/// @param element

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  with(element)
  {
    var marginLeft = 0;
    if(!is_undefined(m_containerMargins[Margins.Left])) 
    {
      marginLeft = m_containerMargins[Margins.Left];
    }
    return x + marginLeft;
  }
}
