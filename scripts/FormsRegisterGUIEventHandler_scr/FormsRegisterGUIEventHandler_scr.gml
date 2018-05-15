/// @description FormsRegisterGUIEventHandler_scr(element, eventType [GUIEventTypes enum], eventHandlerScript)
/// @param element
/// @param  eventType [GUIEventTypes enum]
/// @param  eventHandlerScript

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  var eventType = argument1;
  var eventHandler = argument2;
  with(element)
  {
    if(is_undefined(m_guiEventsMap))
    {
      m_guiEventsMap = ds_map_create();
    }
    
    var eventsList;
    if(!ds_map_exists(m_guiEventsMap, eventType))
    {
      eventsList = ds_list_create();
      m_guiEventsMap[? eventType] = eventsList;
    }
    else
    {
      eventsList = m_guiEventsMap[? eventType];
    }  
    ds_list_add(eventsList, eventHandler);   
  }
}
