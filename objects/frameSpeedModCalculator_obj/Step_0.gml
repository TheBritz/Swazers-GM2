//Calculate frame speed modification
if(m_enabled)
{
  var divisor = 1000000 / room_speed;
  global.FrameSpeedMod = delta_time / divisor;
}

