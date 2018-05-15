/// @description CombatantInitEventsMap_scr()

//Create event lists for each event this combatant will serve
EntityEventServerAddSupportedEvent_scr(id, EVENTS_FIRE_WEAPON);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_GET_HIT_PROJ);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_GET_HIT_MELEE);
EntityEventServerAddSupportedEvent_scr(id, EVENTS_DIE);

