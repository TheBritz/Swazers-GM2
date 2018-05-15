/// @description Projectile Init
event_inherited();
speed = 12;
m_damage = 6;

if(current_hour == hour)
{
  m_damage *= 1.5;
}

init = false;


