/// @description Update position

var xtarg = x + lengthdir_x(m_speed, m_direction);
var ytarg = y + lengthdir_y(m_speed, m_direction);
 
if place_free(xtarg, ytarg) 
{
    x = xtarg;
    y = ytarg;
}
else 
{ 
  var xDiff = xtarg - x;
  var yDiff = ytarg - y;

  for ( var angle = m_sweepInterval; angle <= m_sweepAngleMax; angle += m_sweepInterval) 
  {
    for ( var multiplier = -1; multiplier <= 1; multiplier += 2) 
    {      
      var angle_to_check = m_direction+angle*multiplier;
      xtarg = x+lengthdir_x(m_speed, angle_to_check);
      ytarg = y+lengthdir_y(m_speed, angle_to_check);     
      if place_free(xtarg,ytarg) 
      {
        x = xtarg;
        y = ytarg;  
        exit;       
      }   
    }
  }
}

