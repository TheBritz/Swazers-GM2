/// @description FormsGetContainerMargin_scr(element, margin [Margins enum])
/// @param element
/// @param  margin [Margins enum]

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  var margin = argument1;
  var modifier = 0;
  with(element)
  {
    if(margin == Margins.Right && (m_contentIsOverflowVert && m_scrollbarVertEnabled))  
    {
      modifier = m_scrollbarVertWidth;
    }
    else if(margin == Margins.Bottom && (m_contentIsOverflowHor && m_scrollbarHorEnabled))
    {
      modifier = m_scrollbarHorHeight;
    }
     
    if(margin < array_length_1d(m_containerMargins))
    {
      return m_containerMargins[margin] + modifier;
    }
  }
}
