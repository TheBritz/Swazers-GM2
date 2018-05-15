//event_inherited();

m_moving = false;
if(keyboard_check(vk_left))
{
  Entity_AddToSpeed_scr(id, SpeedType.H, -.25);
  m_moving = true;
}

if(keyboard_check(vk_right))
{
  Entity_AddToSpeed_scr(id, SpeedType.H, .25);
  m_moving = true;
}

if(keyboard_check(vk_up))
{
  Entity_AddToSpeed_scr(id, SpeedType.V, -.25);
  m_moving = true;
}

if(keyboard_check(vk_down))
{
  Entity_AddToSpeed_scr(id, SpeedType.V, .25);
  m_moving = true;
}

if(speed > 5)
{
  Entity_SetSpeed_scr(id, SpeedType.Abs, 5);
  m_moving = true;
}

event_inherited();

