/// @description Projectile Init
event_inherited();
depth = -1000;
m_damage = 0;
pierceNumber = 1;
ammoSprite = ammoBasicBullet_spr;
m_moving = true;
m_drawShadow = false;
m_suppressBasicCollision = false;
m_suppressBasicWallCollision = false;

//Weapon instance reference
m_weapon = noone;

//Projectile attributes
if(!ds_map_exists(global.ProjectileAttributeCache, object_index))
{
  m_projAttributes = ds_map_create();
  global.ProjectileAttributeCache[? object_index] = m_projAttributes; 
}
else
{
  m_projAttributes = global.ProjectileAttributeCache[? object_index];
}

//Create event map
eventsMap = ds_map_create();

//Add event lists for supported event types
EntityEventServerAddSupportedEvent_scr(id, EVENTS_PROJ_HIT);


