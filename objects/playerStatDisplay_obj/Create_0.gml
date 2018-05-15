/// @description Stat display init

//Reference to the player whose stats are being displayed
m_playerInstance = noone;

depth = -1000000000000;

//Each stat list stores entry stores an array. That array contains the stat 
//label in the 0 index and the script to fetch the stat value in the 1 index
m_statsList = ds_list_create();
m_cacheList = ds_list_create();

m_drawCoordsMap = ds_map_create();
m_drawCoordsMap[? 0] = array(20, window_get_height()/2);

m_visible = true;
m_font = font0;
m_verticalSeparation = 30;
m_textSeparation = 20;

//Add damage stat
ds_list_add(m_statsList, array(statIconDamage_spr, PlayerStatsGetDamage_scr));
ds_list_add(m_statsList, array(statIconRof_spr, PlayerGetStatsROF_scr));
ds_list_add(m_statsList, array(statIconProjNumber_spr, PlayerGetStatsProjectileNumber_scr));

