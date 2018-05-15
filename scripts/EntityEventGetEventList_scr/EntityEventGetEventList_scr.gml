/// @description EntityEventGetEventList_scr(instanceOrObjectIndex, eventType)
/// @param instanceOrObjectIndex
/// @param  eventType

var ent = argument0;
var eventType = argument1;

//Get the eventList - this could be in the class event map or in an entity
//instance's event map
var eventList; 
var name = object_get_name(ent);
if(!is_undefined(name) && name != "<undefined>")
{
  var innerMap = global.eventsMapClass[?ent];
  
  if(!is_undefined(innerMap))
  {
    eventList = innerMap[?eventType]; 
  }
  else
  {
    //There isn't an innerMap for this object index - we need to create an 
    //inner map and add an event list for this event type. While entities 
    //are expected to regulate what events can be registered for, there are no
    //such restrictions on class-level events. As such, we need to facilitate
    //any registration fully
    
    //Create an inner map
    innerMap = ds_map_create();
    eventList = ds_list_create();
    innerMap[? eventType] = eventList;
    global.eventsMapClass[? ent] = innerMap;  
  }
}
else if(instance_exists(ent))
{
  if(is_undefined(ent.eventsMap)) 
  {
    ent.eventsMap = ds_map_create();
  }
  
  if(!ds_map_exists(ent.eventsMap, eventType))
  {
    ent.eventsMap[? eventType] = ds_list_create();
  }
  
  eventList = ent.eventsMap[? eventType];   
}

return eventList;
