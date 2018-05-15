/// @description EntityEventFire_scr(entityInstance, eventType)
/// @param entityInstance
/// @param  eventType

var ent = argument0;
var eventType = argument1;

//Get the class-level event registrations if they exist. All the way up through
//its inheritence lineage.
var eventListArr;
eventListArr[0] = EntityEventGetEventList_scr(ent.object_index, eventType);
var i = 1;
var noParent = -100;
var objInd = object_index;
while(objInd != noParent)
{
  eventListArr[i++] = EntityEventGetEventList_scr(objInd, eventType);
  objInd = object_get_parent(objInd);
}

if(instance_exists(ent))
{
  if(!is_undefined(ent.eventsMap))
  {   
    with(ent)
    {
      //Get the event array list for this event type
      eventListArr[i] = eventsMap[? eventType];
      var eventList, eventArr;
      for(var n = 0; n < array_length_1d(eventListArr); n++)
      {
        eventList = eventListArr[n];
        if(!is_undefined(eventList))
        {
          for(var i = 0; i < ds_list_size(eventList); i++)
          {
            eventArr = eventList[|i];
            //Execute the event array
            if(is_array(eventArr))
            {
              script_execute(eventArr[EVENT_ARRAY_SCRIPT], eventArr[EVENT_ARRAY_ARGS]);    
            }
          }
        }
      }
    }
  }
}
else if(debug_mode)
{
  show_message_async("An instance of " + object_get_name(object_index) +
    "tried to fire an event on an instance that doesn't exist.");
}
