event_inherited();

image_speed = 0;

m_playerMonitorList = ds_list_create();
m_active = true;

var width = sprite_width;
var height = sprite_height;

var hRel = sprite_width/2 - sprite_xoffset;
var vRel = sprite_height/2 - sprite_yoffset;

m_midpointRelCoords = array(hRel, vRel);

