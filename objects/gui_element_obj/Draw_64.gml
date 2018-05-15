/// @description Perform draw from the drawScript
if(surface_exists(obscureSurf) && !obscureIgnore)
{
  draw_sprite_part(obscureSpr, image_index, obscureLeft, obscureTop,
    obscureWidth, obscureHeight, x - sprite_get_xoffset(obscureSpr), 
    y - sprite_get_yoffset(obscureSpr));
  //draw_surface_part(obscureSurf, obscureDrawLeft, obscureDrawTop, 
    //obscureDrawWidth, obscureDrawHeight, x + obscureDrawX, y + obscureDrawY);   
}
else if(!is_undefined(drawScript))
{
  script_execute(drawScript, false, drawArgs);
}

