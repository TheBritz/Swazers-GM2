/// @description Set rect_width and rect_height and borders
draw_set_font(my_font);
rect_width = string_width(string_hash_to_newline(text))*scale;
rect_height = string_height(string_hash_to_newline(text))*scale;

if(h_align == fa_center)
{
  borderL = x - rect_width/2 - rect_margin;
  borderR = x + rect_width/2 + rect_margin;
}
else if(h_align == fa_left)
{
  borderL = x - rect_margin;  
  borderR = x + rect_margin + rect_width;
}
else if(h_align == fa_right)
{
  borderL = x - rect_margin - rect_width;
  borderR = x + rect_margin;
}

if(v_align == fa_middle)
{
  borderU = y - rect_margin - rect_height/2;
  borderD = y + rect_height/2 + rect_margin;
}
else if(v_align == fa_top)
{
  borderU = y - rect_margin;
  borderD = y + rect_height + rect_margin;
}
else if(v_algin == fa_bottom)
{
  borderU = y - rect_margin - rect_height;
  borderD = y + rect_margin;
}

obscureOffsetX = x - borderL;
obscureOffsetY = y - borderU;

container_w = borderR - borderL;
container_h = borderD - borderU;

borderRel_l = borderL - x;
borderRel_r = borderR - x;
borderRel_u = borderU - y;
borderRel_d = borderD - y; 

mask_index = menu_mask_spr;
image_xscale = (rect_width + rect_margin*2)/mask_w;
image_yscale = (rect_height + rect_margin*2)/mask_h;

///Inherited gui_element_obj event and relative scaling
event_inherited();





with (other) {
///Control Mouse-over
var runCheck;
if(instance_exists(container))
{
  if(UIContainerIsPointWithin_scr(container, cursorObject.x, cursorObject.y))
  {
    runCheck = true;
  }
  else
  {
    runCheck = false;
  }
}
else
{
  runCheck = true;
}

if(runCheck && place_meeting(borderL, borderU, cursorObject))
{
  if(unselected && !is_undefined(mouseover_script))
  {
    script_execute(mouseover_script, mouseover_arg);  
  }
  unselected = false;
  text_color = -1;
  if(mouse_check_button_released(mb_left)) //&& manager.dead != true)
  {
    if(!is_undefined(my_script))
    {
      script_execute(my_script, my_args);
    }
  }
  if(checkable)
  {
    selected = true;
  }
}
else
{
  unselected = true;
  text_color = my_color
}


}
