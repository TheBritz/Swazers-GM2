/// @description EntityEventDestroyEventMap_scr(entityInstance)
/// @param entityInstance

var ent = argument0;

var eventType, eventList;
if(!is_undefined(eventsSupported) && !is_undefined(eventsMap))
{
  for(var i = 0; i < ds_list_size(eventsSupported); i++)
  {
    eventType = eventsSupported[|i];   
    eventList = eventsMap[? eventType];
    
    if(!is_undefined(eventList))
    {
      var eventArr, args;
      for(var ii = 0; ii < ds_list_size(eventList); ii++)
      {
        eventArr = eventList[|i];
        args = eventArr[@ EVENT_ARRAY_ARGS];
        args = undefined;
        eventList[|i] = undefined;
      }
      ds_list_destroy(eventList);
    }
    
  }
  ds_list_destroy(eventsSupported);
  ds_map_destroy(eventsMap);
}


