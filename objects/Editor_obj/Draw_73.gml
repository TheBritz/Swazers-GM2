/// @description Draw Selection Graphics on selected instances
var instance, corners, coords1, coords2;
for(var i = 0; i < ds_list_size(m_selectedList); i++)
{
  instance = m_selectedList[| i];
  with(instance)
  {  
    corners = other.m_instanceCornersMap[? id];
    var listSize = ds_list_size(corners);
    for(var n = 0; n < listSize; n++)
    {
      coords1 = corners[| n];
      if(n < listSize - 1)
      { 
        //Get the next point to draw to
        coords2 = corners[| n + 1];
      }
      else
      {
        //Back around to the first point
        coords2 = corners[| 0]; 
      }  
      
      draw_line_colour(coords1[0], coords1[1], coords2[0], coords2[1], other.m_selectColor, other.m_selectColor);   
    }
  }
}

