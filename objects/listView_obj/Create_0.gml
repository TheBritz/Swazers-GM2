/// @description listView_obj init

//gui element init
event_inherited();

//List title
title = "List View";

//Internal use members
listContentsChanged = false;

//List groups - these are what store the actual items
listGroups = ds_list_create();
baseGroup = instance_create(x, y, listGroup_obj);
baseGroup.name = undefined;

//List display settings
listViewSettings = ds_map_create();
ListViewSetDefaultSettings_scr();

