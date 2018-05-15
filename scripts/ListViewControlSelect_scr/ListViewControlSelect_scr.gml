/// @description Control select

if(instance_exists(global.cursor))
{
  var cursor_x = global.cursor.x;
  var cursor_y = global.cursor.y;    
  
  //Container mouseover
  var border_l = x;
  var border_r = x + container_w;
  var border_u = y;
  var border_d = y + container_h;
  
  if(cursor_x >= border_l && cursor_x <= border_r && cursor_y >= border_u && cursor_y <= border_d)
  {
    //Assert focus over other gui objects
    if(!has_focus)
    {
        with(gui_element_obj)
        {
          has_focus = false;
        }
        has_focus = true;    
    }
  }
  else
  {
    has_focus = false;
  }     
  
  //Only allow for individual item selection if the cursor is in the container. 
  if(has_focus)
  {
    var this_item;
    for(var i = 0; i < ds_list_size(items); i++;)
    {
      this_item = ds_list_find_value(items,i);
      if(this_item.interactive)
      {
        var border_l = this_item.x - item_xoff;
        var border_r = border_l + item_w;
        var border_u = this_item.y - item_yoff;
        var border_d = border_u + item_h;
        if(cursor_x >= border_l && cursor_x <= border_r && cursor_y >= border_u && cursor_y <= border_d)
        {   
          if(i != selected_index && dnd_index == -1)
          {
              this_item.color = item_mouseover_color;
          }
          //this_item.fill = item_sel_fill;
          if(mouse_check_button_pressed(mb_left))
          {
            if(selected_index != -1)
            {
              var selected_item = ds_list_find_value(items,selected_index);
              selected_item.color = item_color;
            }
            if(selected_index != i)
            {
              selected_index = i;
              if(!is_undefined(sound_select))
              {
                  audio_play_sound(sound_select, 0, false);
              }
            }
            this_item.color = item_sel_color;
            if(!is_undefined(item_select_event))
            {
              script_execute(item_select_event, this_item, args)
            }
            
            if(drag_and_drop)
            {
              dnd_index = i;
              this_item.cursor_grab_x = cursor_x - this_item.x;
              this_item.cursor_grab_y = cursor_y - this_item.y;
            }
          }
        }
        else if(i != selected_index)
        {
          this_item.color = item_color;
          this_item.fill = item_fill;
        }
      }
    }
  }
}
