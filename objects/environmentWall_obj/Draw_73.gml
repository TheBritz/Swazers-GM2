if(debug_mode)
{
  if(!is_undefined(farPointX) && !is_undefined(farPointY))
  {
    draw_set_colour(c_red);
    draw_circle(farPointX, farPointY, 5, false);
    draw_set_colour(c_blue);
    draw_circle(x, y, 3, false);
  }
  
  var coords;
  draw_set_colour(c_aqua);
  for(var i = 0; i < ds_list_size(m_corners); i++)
  {
    coords = m_corners[|i];
    //draw_circle(coords[0], coords[1], 2, false);  
    draw_point(coords[0], coords[1]);
    
    coords = m_cornersInternal[|i];
    //draw_circle(coords[0], coords[1], 2, false);  
    draw_point(coords[0], coords[1]);
        
    coords = m_cornersExternal[|i];
    //draw_circle(coords[0], coords[1], 2, false);  
    draw_point(coords[0], coords[1]);
  }
}

