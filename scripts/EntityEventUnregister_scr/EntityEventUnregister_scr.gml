/// @description EntityEventUnregister_scr(entityInstance, eventType, eventID)
/// @param entityInstance
/// @param  eventType
/// @param  eventID

var ent = argument0;
var eventType = argument1;
var eventID = argument2;

var eventList = EntityEventGetEventList_scr(ent, eventType);

//If we found an actual list, look for the event to delete 
if(!is_undefined(eventList))
{ 
  for(var i = 0; i < ds_list_size(eventList); i++)
  {
    var eventArr = eventList[i];
    if(eventArr[EVENT_ARRAY_ID] == eventID)
    {
      //We found the event we need to unregister for, unregister by deleting
      //the event array in the list index
      ds_list_delete(eventList, i);
      exit;
    }
  }
}



