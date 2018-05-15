/// @description PlayerInitEventsMap_scr()

if(is_undefined(eventsMap))
{
  eventsMap = ds_map_create();
}

//Create event lists for each event type this player will support
EntityEventServerAddSupportedEvent_scr(id, EVENTS_COLLECT_GUN);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_DROP_GUN);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_COLLECT_SWORD);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_DROP_SWORD);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_COLLECT_PASSIVE);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_DROP_PASSIVE);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_COLLECT_ACTIVE);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_DROP_ACTIVE);

