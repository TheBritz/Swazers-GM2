/// @description Init Shotgun Pellet
event_inherited();
speed = random_range(16, 18);
accel = -.2;
alarm[0] = 0;

m_damage = 1;
m_projAttributes[? PROJ_ATTR_DMG] =  1;
m_projAttributes[? PROJ_ATTR_NUMBER] = 1;

var framesAlive = abs((speed - 2)/accel);
image_speed = 1/framesAlive * image_number;

