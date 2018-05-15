/// @description Container-based relative positioning
if(instance_exists(container))
{
  //X positioning
  if(!is_undefined(cont_rel_posx))
  {
    x = container.x + cont_rel_posx * container.container_w;
  }
  else if(!is_undefined(cont_abs_posx))
  {
    x = container.x + cont_abs_posx;
  }
  
  //Y positioning
  if(!is_undefined(cont_rel_posy))
  {
    y = container.y + cont_rel_posy * container.container_h;
  }
  else if(!is_undefined(cont_abs_posy))
  {
    y = container.y + cont_abs_posy;
  }
  
  if(!is_undefined(cont_rel_w))
  {
    container_w = cont_rel_w * container.container_w;
  }
  else if(!is_undefined(cont_abs_w))
  {
    container_w = cont_abs_w;
  }
  
  if(!is_undefined(cont_rel_h))
  {
    container_h = cont_rel_h * container.container_h;
  }
  else if(!is_undefined(cont_abs_h))
  {
    container_h = cont_abs_h;
  }
  
  //Check for a change in container dimensions
  if(container_w != container_w_last || container_h != container_h_last)
  {
    dimensions_changed = true;
  }
  else
  {
    dimensions_changed = false;
  }
  
  uiPosX = x;
  uiPosY = y;
}


