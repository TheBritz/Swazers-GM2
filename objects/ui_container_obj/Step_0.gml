/// @description Inherited Event
event_inherited();

///Debug test controls
if(debug_mode && !instance_exists(container))
{
  if(keyboard_check(ord("W"))) y -= 5;
  if(keyboard_check(ord("S"))) y += 5;
  if(keyboard_check(ord("A"))) x -= 5;
  if(keyboard_check(ord("D"))) x += 5;
  
  if(keyboard_check(vk_up)) container_h_disp_diff -= 5;
  if(keyboard_check(vk_down)) container_h_disp_diff += 5;
  if(keyboard_check(vk_left)) container_w_disp_diff -= 5;
  if(keyboard_check(vk_right)) container_w_disp_diff += 5;
  
  if(keyboard_check(vk_space))
  {
    cont_w_target = irandom_range(40, 1200);
    cont_h_target = irandom_range(20, 800);
  }
}

///Container shifting

var diff;
if(!is_undefined(cont_w_target) && !is_undefined(cont_w_change_rate))
{
  diff = cont_w_target - container_w;
  container_w += diff * cont_w_change_rate;
  
  if(abs(diff) < 1)
  {
    container_w = cont_w_target
    cont_w_target = undefined;
  }
}

if(!is_undefined(cont_h_target) && !is_undefined(cont_h_change_rate))
{
  diff = cont_h_target - container_h;
  container_h += diff * cont_h_change_rate;
  
  if(abs(diff) < 1)
  {
    container_h = cont_h_target
    cont_h_target = undefined;
  }
}

