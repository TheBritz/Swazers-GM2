/// @description EntityEventServerAddSupportedEvent_scr(entityInstance, eventType)
/// @param entityInstance
/// @param  eventType

//This script adds the infrastructure for supporting an event of a given type.
//Remember, if implementing an event-serving entity, you still actually have to
//call EntityEventFire_scr at the appropriate time to fulfill the purpose of
//the event

var ent = argument0;
var eventType = argument1;

if(instance_exists(ent))
{
  //Check if eventsMap has been created yet
  if(is_undefined(eventsMap))
  {
    eventsMap = ds_map_create();
  }
  
  //Check if eventsSupported list has been created
  if(is_undefined(eventsSupported))
  {
    eventsSupported = ds_list_create();
  }
  
  //Create an event list and add the event type to the supported events list
  eventsMap[? eventType] = ds_list_create();
  ds_list_add(eventsSupported, eventType);
  
}
