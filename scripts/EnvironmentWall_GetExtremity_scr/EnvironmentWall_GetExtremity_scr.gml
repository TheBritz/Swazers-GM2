/// @description EnvironmentWall_GetExtremity_scr(wall, extremity)
/// @param wall
/// @param  extremity

var wall = argument0;
var extremity = argument1;

if(extremity == Extremity.Left)
{
  return wall.m_extremityLeft;
}
else if(extremity == Extremity.Right)
{
  return wall.m_extremityRight;
}
else if(extremity == Extremity.Top)
{
  return wall.m_extremityUp;
}
else if(extremity == Extremity.Bottom)
{
  return wall.m_extremityDown;
}

return undefined;
