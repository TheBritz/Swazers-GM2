/// @description Arrange items in list view
var yy = margin + scroll_mod + list_y;
var top = yy;
if(ds_list_size(sections) < 1)
{
  coords = ListViewArrangeItems_scr(items, margin, list_y + margin + scroll_mod);
  yy = coords[1] + margin + item_h;
}
else //Sections are being used
{   
  var xx = margin;
  var this_list, this_section, coords;
  for(var i = 0; i < ds_list_size(sections); i++;)
  {
    this_section = ds_list_find_value(sections, i);
    this_section.y = y + yy;
    this_section.x = x + xx;
    yy += section_h;
    this_list = this_section.items;
    coords = ListViewArrangeItems_scr(this_list, margin, yy);
    yy = coords[1] + margin + item_h;
  }
}

list_height = yy + item_h - top;
if(list_height > list_cont_h)
{
  can_scroll = true;
}
else
{
  can_scroll = false;
}

///Control select

ListViewControlSelect_scr();

///Control drag and drop
if(dnd_index != -1)
{
    var release = false;
    var this_list = noone;
    var this_item = ds_list_find_value(items, dnd_index);
    
    this_item.x = global.cursor.x - this_item.cursor_grab_x;
    this_item.y = global.cursor.y - this_item.cursor_grab_y;   
        
    if(mouse_check_button_released(mb_left))
    {   
        release = true;        
    }
    
    with(this_item)
    {
        mask_index = dnd_mask_spr;    
        image_xscale = other.item_w/sprite_get_width(dnd_mask_spr);
        image_yscale = other.item_h/sprite_get_height(dnd_mask_spr);
        
        this_list = instance_place(x,y,list_view_obj);
        if(instance_exists(this_list) && this_list.drag_and_drop && this_list != parent)
        {
            other.dnd_add_spr = dnd_move_spr;
            if((this_list.capacity > 0 && ds_list_size(this_list.items) <= this_list.capacity) || this_list.capacity < 0)
            {
                //Can add; perform custom evaluation.
                if(!is_undefined(this_list.dnd_eval_script))      //Perform custom evaluation
                {                     
                    if(script_execute(this_list.dnd_eval_script, this_item, this_list))
                    {
                        if(ds_list_size(this_list.items) == this_list.capacity)
                        {
                            other.dnd_image_index = 2;    
                        }
                        else
                        {
                            other.dnd_image_index = 1;                            
                        }
                    }
                    else
                    {
                        other.dnd_image_index = 0;
                    }
                }
                else
                {
                    if(ds_list_size(this_list.items) == this_list.capacity)
                    {
                        other.dnd_image_index = 2;    
                    }
                    else
                    {
                        other.dnd_image_index = 1;                            
                    }
                }
            }
            else
            {
                other.dnd_image_index = 0;
            }
        }
    }
    
    if(release)
    {
        dnd_index = -1;
        selected_index = -1;    
        if(instance_exists(this_list) && this_list != this_item.parent && dnd_image_index != 0)
        {
            //Add to the other list
            if(dnd_image_index = 2)
            {
                SwitchItem_scr(this_item, id, this_list);                
            }
            else
            {
                DropItem_scr(this_item, id, this_list);
            }
        }
    }
    
}

