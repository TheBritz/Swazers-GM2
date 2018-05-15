/// @description Highlight collectible

//Rudimentary implementation for prototyping - we will eventually need to
//gather a list and prioritize based on importance and proximity and also let
//players cycle through the interactibles 
//Will also have to include interactibleShadow_obj instances
m_interactible = instance_nearest(x, y, interactibleBase_obj);

if(instance_exists(m_interactible) && 
  distance_to_object(m_interactible) < m_interactRange)
{
  //Add this instance to 
  with(m_interactible)
  {
    ds_list_add(m_highlighterList, other.id);
  }
}
else
{
  m_interactible = noone;
}

///Ancestor events
event_inherited();

///Independent Axis Slowdown
/*
if(m_moving)
{
  if(!is_undefined(m_movingHor) && !is_undefined(m_movingVert))
  {
    //Horizontal slowdown
    if(!m_movingHor)
    {
      if(abs(hspeed) >= deccelKbd)
      {
        hspeed -= sign(hspeed) * deccelKbd; 
      }
      else
      {
        hspeed = 0;
      }
    }
    
    //Vertical slowdown
    if(!m_movingVert)
    {
      if(abs(vspeed) >= deccelKbd)
      {
        vspeed -= sign(vspeed) * deccelKbd; 
      }
      else
      {
        vspeed = 0;
      }
    }
  }
}

/* */
///Ancestor events
event_inherited();

/* */
/*  */
