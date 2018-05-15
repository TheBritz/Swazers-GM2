/// @description Inherited Event and relative positioning
event_inherited();

if(!is_undefined(item_rel_w) && !is_undefined(item_rel_h))
{
  item_w = item_rel_w * container_w;
  item_h = item_rel_h * container_h;
}

///Set Items scale
if(!is_undefined(sprite_index))
{
  var this_item;
  var limit, limit_dim;
  var w,h;
  var offset_x, offset_y;
  for(var i = 0; i < ds_list_size(items); i++;)
  {
    this_item = ds_list_find_value(items,i);
    this_item.draw_me = true;
    
    w = sprite_get_width(this_item.sprite_index);
    h = sprite_get_height(this_item.sprite_index);   

    //find limit
    if(w - item_w >= h - item_h)
    {
      limit = w;
      limit_dim = item_w;  
    }        
    else
    {
      limit = h;
      limit_dim = item_h;
    }
    
    //set scale
    var this_scale = (limit_dim - stretch_margin*2)/limit;
    this_item.scale = this_scale;

    if(limit == w)
    {
      this_item.adjust_y = (item_h - (h*this_scale + stretch_margin*2))/2;
      this_item.adjust_x = 0;
    }
    else
    {
      this_item.adjust_x = (item_w - (w*this_scale + stretch_margin*2))/2
      this_item.adjust_y = 0;
    }
    
    //Find partial draw value(s)
    var part_it_dr, spr_h;
    spr_h = sprite_get_height(this_item.sprite_index);
    
    this_item.draw_item_y = stretch_margin + this_item.y + this_item.adjust_y;
    this_item.draw_item_top = 0;
    this_item.draw_item_h = spr_h;
    if(this_item.draw_rect_h != item_h)
    {    
      if(this_item.draw_rect_y == y + list_y)
      {
        if((this_item.y + stretch_margin + this_item.adjust_y) < y + list_y)
        {
          this_item.draw_item_y = y + list_y;
          this_item.draw_item_top = (y + list_y - (this_item.y + stretch_margin + this_item.adjust_y))/this_scale;
         
          part_it_dr = spr_h - this_item.draw_item_top; 
          if(part_it_dr > 0 && this_item.draw_item_top < spr_h)
          {
            this_item.draw_item_h = part_it_dr;
          }
          else
          {  
            this_item.draw_item_h = 0; 
          }
        }
        else
        {

        }
      }
      else
      {
          
        part_it_dr = this_item.draw_rect_h - stretch_margin - this_item.adjust_y;
        //part_it_dr = (container_h - y) - (this_item.y + stretch_margin*this_scale + this_item.adjust_y);
        //part_it_dr = container_h - (this_item.y - y + this_item.adjust_y) - stretch_margin + (spr_h*this_scale - spr_h);
        if(part_it_dr < 0)
        {
          this_item.draw_me = false;
        }
        else if(part_it_dr < spr_h*this_scale && part_it_dr > 0)
        {
          this_item.draw_item_h = part_it_dr/this_scale;
        }
        else
        {   
          //Set adjust value
          //this_item.adjust_x += sprite_get_xoffset(this_item.sprite_index)*this_scale; 
          //this_item.adjust_y += sprite_get_yoffset(this_item.sprite_index)*this_scale;
        }
      }
        
    }
    else
    {
      //Set adjust value
      //this_item.adjust_x += sprite_get_xoffset(this_item.sprite_index)*this_scale; 
      //this_item.adjust_y += sprite_get_yoffset(this_item.sprite_index)*this_scale;
    }
  }
}

///Set collision mask scale (for dnd)
image_xscale = container_w/sprite_get_width(mask_index);
image_yscale = container_h/sprite_get_height(mask_index);

with (list_view_obj) {
///Control Scroll

if(can_scroll)
{   
    list_cont_w = container_w - scrollbar_w;     
    if(has_focus)
    {
        if(!is_undefined(scroll_item_fraction))
        {   
            scroll_inc = item_h*scroll_item_fraction
        }
        
        if(mouse_wheel_down() || keyboard_check_pressed(vk_up))
        {
            scroll_mod += scroll_inc;
        }
        else if(mouse_wheel_up() || keyboard_check_pressed(vk_down))
        {
            scroll_mod -= scroll_inc;
        }
        
        if(scroll_mod + list_height < list_cont_h)
        {
            scroll_mod = list_cont_h - list_height;
        }
        else if(scroll_mod > 0)
        {
            scroll_mod = 0;
        }
    }
    
    scrollbar_h = list_cont_h*((list_cont_h - margin)/list_height);    
    scrollbar_y = y + list_y - scroll_mod*((list_cont_h - margin)/list_height) + margin/2;
    scrollbar_x = x + container_w - scrollbar_w - margin/2;
    
    var cursor_x = global.cursor.x;
    var cursor_y = global.cursor.y;
    
    var border_l = scrollbar_x;
    var border_r = scrollbar_x + scrollbar_w;
    var border_u = scrollbar_y;
    var border_d = scrollbar_y + scrollbar_h;
    
    if(cursor_x >= border_l && cursor_x <= border_r && cursor_y >= border_u && cursor_y <= border_d)
    {
        scrollbar_draw_col1 = color_shift(scrollbar_col1, "v", -20);
        scrollbar_draw_col2 = color_shift(scrollbar_col2, "v", -20);
        if(mouse_check_button_pressed(mb_left))
        {                 
            scrollbar_drag = true;
            scrollbar_grab_y = scrollbar_y - cursor_y;    
        }       
    }
    else
    {
        scrollbar_draw_col1 = scrollbar_col1;
        scrollbar_draw_col2 = scrollbar_col2;
    }
    
    if(mouse_check_button_released(mb_left))
    {
        scrollbar_drag = false; 
    }
    
    if(scrollbar_drag)
    {
        scrollbar_draw_col1 = color_shift(scrollbar_col1, "v", -40);
        scrollbar_draw_col2 = color_shift(scrollbar_col2, "v", -40);
        
        scrollbar_y = global.cursor.y + scrollbar_grab_y;
        if(scrollbar_y + scrollbar_h > y + list_y + list_cont_h - margin/2)
        {
            scrollbar_y = y + list_y + list_cont_h - scrollbar_h - margin/2;
        }
        else if(scrollbar_y < y + list_y + margin/2)
        {
            scrollbar_y = y + list_y + margin/2;
        }
        
        scroll_mod = -1*(scrollbar_y - y - list_y - margin/2)*list_height/(list_cont_h - margin);
    }
    else
    {   
        //scrollbar_draw_col1 = scrollbar_col1;
        //scrollbar_draw_col2 = scrollbar_col2;
    }
}
else
{
    list_cont_w = container_w
}

}
