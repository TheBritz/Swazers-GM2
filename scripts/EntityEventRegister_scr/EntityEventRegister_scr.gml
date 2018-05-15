/// @description EntityEventRegister_scr(entityInstance, eventType, eventScript, eventArgs, eventID [optional])
/// @param entityInstance
/// @param  eventType
/// @param  eventScript
/// @param  eventArgs
/// @param  eventID [optional]

var ent = argument[0];
var eventType = argument[1];
var eventScript = argument[2];
var eventArgs = argument[3];
var eventID = undefined;
if(argument_count > 4)
{
  eventID = argument[4];
}

var eventList = EntityEventGetEventList_scr(ent, eventType);

if(instance_exists(ent))
{
  with(ent)
  {
    if(!is_undefined(eventList))
    {      
      //Event arrays are 3-member arrays that contain the script in the 0-index,
      //the argument array in the 1-index, and the owner (the instance that
      //registered the event) 
      var eventArray = array(eventScript, eventArgs, eventID);
      ds_list_add(eventList, eventArray);
    }
    else if(debug_mode)
    {
      //If we get here, something went wrong; someone tried to register for an
      //unsupported event.
      show_message_async("Warning: an instance of " + 
        object_get_name(eventOwner.object_index) + 
        " tried to register with an instance of " + object_get_name(object_index) + 
        " for an event it doesn't support. Event number: " + eventType);
    }
  }
}
