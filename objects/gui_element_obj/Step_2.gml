/// @description Obscure logic
if(instance_exists(container))
{  
  if(!obscureIgnore)
  {
    var obscureArr = UIElementObscured_scr(container, id, array(obscureOffsetX, obscureOffsetY));
    obscureMode = obscureArr[OBSCURE_MODE];
  
    if(obscureModeLast == OBSCURE_MODE_PART && obscureMode != OBSCURE_MODE_PART)
    {
      surface_free(obscureSurf);
      obscureSurf = -1;
    }
    
    if(obscureMode == OBSCURE_MODE_FULL)
    {
      visible = false;
    }
    else if(obscureMode == OBSCURE_MODE_PART)
    {
      visible = true;
      if(obscureMode == OBSCURE_MODE_PART)
      {
        obscureLeft = obscureArr[OBSCURE_LEFT];
        obscureTop = obscureArr[OBSCURE_TOP];
        obscureWidth = obscureArr[OBSCURE_WIDTH];
        obscureHeight = obscureArr[OBSCURE_HEIGHT];
        
        if(obscureDefault && !is_undefined(drawScript))
        {
          if(!surface_exists(obscureSurf))
          {
            obscureSurf = surface_create(container_w, container_h);
          }
          //UIElementSetObscureDrawMembers_scr();
          surface_set_target(obscureSurf);
          draw_clear_alpha(c_white, 0);
          script_execute(drawScript, true, drawArgs);
          if(object_is(object_index, ui_container_obj))
          { 
            if(container.x + UIContainerDisplayWidth_scr(container) < x + UIContainerDisplayWidth_scr(id))
            {
              container_w_disp_diff = container.x + UIContainerDisplayWidth_scr(container) - (x + container_w); 
            }
            
            if(container.y + UIContainerDisplayHeight_scr(container) < y + UIContainerDisplayHeight_scr(id))
            {
              container_h_disp_diff = container.y + UIContainerDisplayHeight_scr(container) - (y + container_h); 
            }
          }
          surface_reset_target(); 
          //TODO: add logic that checks if a new sprite is needed
          if(sprite_exists(obscureSpr))
          {
            sprite_delete(obscureSpr);
          }           
          obscureSpr = sprite_create_from_surface(obscureSurf, 0, 0, 
            container_w, container_h, false, false, obscureOffsetX, obscureOffsetY);
        }
      }
    }
    else if(obscureMode == OBSCURE_MODE_NONE)
    {
    }
    obscureModeLast = obscureMode;
  } 
}

