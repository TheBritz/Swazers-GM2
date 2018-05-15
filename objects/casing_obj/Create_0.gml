/// @description Casing init
event_inherited();
m_shadowHeight = 4;
m_bounceCoef = .4;
deccel = .4;
m_bounceReady = false;
m_partType = undefined;
if(!ds_map_exists(global.CasingPartTypeMap, object_index))
{
  m_partType = part_type_create();
  part_type_sprite(m_partType, sprite_index, false, false, false);
  part_type_life(m_partType, room_speed*120, room_speed*120);
  global.CasingPartTypeMap[? object_index] = m_partType;
}
else
{
  m_partType = global.CasingPartTypeMap[? object_index];
}

