keyPressMap = ds_map_create();
debugActions = ds_map_create();
m_debuggerList = ds_list_create();
m_showList = false;
m_currentPage = 0;
m_listPageDisplay = 9;
var num_base = 48;

DebugBuildDebuggerList_scr();

//ds_map_add(map, DEBUG_SCRIPT, DebugCreateServer_scr);
//ds_map_add(map, DEBUG_DESCRIPTION, "Create server object");
//ds_map_add(map, DEBUG_PRESS_TYPE, PRESS_TYPE_PRESS);
//ds_map_add(debugActions, 0, map);
DebugRegisterAction_scr(num_base, PRESS_TYPE_PRESS, DebugCreateServer_scr, "Create server object");

//ds_map_add(map, DEBUG_SCRIPT, DebugCreateClient_scr);
//ds_map_add(map, DEBUG_DESCRIPTION, "Create client object");
//ds_map_add(map, DEBUG_PRESS_TYPE, PRESS_TYPE_PRESS);
//ds_map_add(debugActions, 1, map);
DebugRegisterAction_scr(num_base + 1, PRESS_TYPE_PRESS, DebugCreateClient_scr, "Create client object");

DebugRegisterAction_scr(num_base + 2, PRESS_TYPE_PRESS, DebugCreatePlayer_scr, "Create player 1 object", 1);

DebugRegisterAction_scr(num_base + 3, PRESS_TYPE_PRESS, DebugGoToTestRoom_scr, "Go to the test room")

