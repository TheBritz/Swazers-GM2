/// @description FormsRemoveContentElement_scr(childElement)
/// @param childElement

var childElement = argument0;

if(instance_exists(childElement.m_containerElement))
{
  with(childElement.m_containerElement)
  {
    if(!is_undefined(m_contentElementsList))
    {
      var index = ds_list_find_index(m_contentElementsList, childElement);
      if(index >= 0)
      {
        ds_list_delete(m_contentElementsList, index);
      }
    }
  }
  childElement.m_containerElement = noone;
}
