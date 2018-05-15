/// @description FormsAddContentElementInstance_scr(containerElement, contentElement)
/// @param containerElement
/// @param  contentElement

var parentElement = argument0;
var childElement = argument1;
if(IsLegalFormsElement_scr(parentElement) && 
   IsLegalFormsElement_scr(childElement))
{
  childElement.depth = parentElement.depth - 1;
  with(parentElement)
  {
    if(is_undefined(m_contentElementsList))
    {
      //Remove child from other element list
      FormsRemoveContentElement_scr(childElement);
      m_contentElementsList = ds_list_create();
      ds_list_add(m_contentElementsList, childElement);
      childElement.m_containerElement = parentElement;
    }
    else
    {
      //Don't allow duplicates
      if(ds_list_find_index(m_contentElementsList, childElement) == -1)
      {
        //Remove child from other element list
        FormsRemoveContentElement_scr(childElement);
        ds_list_add(m_contentElementsList, childElement);
        childElement.m_containerElement = parentElement;
      }
    }
  }
}
