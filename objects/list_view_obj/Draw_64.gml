/// @description Draw List
if(!is_undefined(bg_color))
{
  draw_set_alpha(bg_alpha);
  draw_rectangle_colour(x,y,x + container_w, y + container_h, bg_color, bg_color, bg_color, bg_color, false);
  draw_set_alpha(1);
}

if(debug_mode)
{
  draw_sprite_ext(mask_index,0,x,y,image_xscale,image_yscale,0,c_blue,.075);
}

//Draw container
var c_n = 3;
draw_rectangle_colour(x, y, x + container_w, y + container_h,cont_color[c_n--],cont_color[c_n--],cont_color[c_n--],cont_color[c_n--],true);

//Draw sections
var this_section;
draw_set_font(title_font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for(var i = 0; i < ds_list_size(sections); i++;)
{
  this_section = ds_list_find_value(sections, i); 
  if(this_section.y >= y + list_y)
  {
    draw_text_transformed_colour(this_section.x, this_section.y, string_hash_to_newline(this_section.title), 2, 2, 0, c_aqua, c_aqua, c_blue, c_blue, 1);
  }
}

//Draw items
var this_x, this_y, this_scale, draw_h, item_draw_h, draw_w, rect_dr_y, item_dr_top, item_dr_y;
for(var i = 0; i < ds_list_size(items); i++;)
{
  this_item = ds_list_find_value(items,i);    
  this_x = this_item.x;
  this_y = this_item.y;
  this_scale = this_item.scale;
  if(item_stretch == false)
  {
    this_scale = 1;
  }   
  if(this_x != NOT_A_VALUE && i != dnd_index)
  {
      
    draw_rectangle_colour(this_x,this_item.draw_rect_y,this_x+item_w,this_item.draw_rect_y+this_item.draw_rect_h,this_item.color,this_item.color,this_item.color,this_item.color,!this_item.fill);
    if(!is_undefined(this_item.sprite_index) && this_item.draw_me)
    {
      draw_sprite_part_ext(this_item.sprite_index,this_item.image_index,0,this_item.draw_item_top,sprite_get_width(this_item.sprite_index),this_item.draw_item_h,stretch_margin + this_x + this_item.adjust_x, this_item.draw_item_y, this_scale, this_scale,-1,1);
      /*
      if(!is_undefined(this_item.partial_item_draw_h))
      {
          //draw_sprite_part_ext(this_item.sprite_index,this_item.image_index,item_dr_top,0,sprite_get_width(this_item.sprite_index),this_item.partial_item_draw_h/this_scale,stretch_margin + this_x + this_item.adjust_x, item_dr_y, this_scale, this_scale,-1,1);
          
      }
      else
      {
         // draw_sprite_ext(this_item.sprite_index,this_item.image_index,stretch_margin + this_x + this_item.adjust_x,item_dr_y,this_scale,this_scale,0,-1,1);
      }
      */
    }
    
    if(false)//debug_mode)
    {
      draw_set_font(console_font_sm);
      draw_set_valign(fa_top);
      draw_set_halign(fa_left);
      draw_text_colour(this_item.x,this_item.y,string_hash_to_newline(this_item.title),c_red,c_red,c_red,c_red,1);
      //draw_sprite_ext(wep_type_icons_spr, 0, this_item.x + 5, this_item.y + 5,2,2,0,c_red,1);
    } 
  } 
}

//Draw container
c_n = 3;
draw_rectangle_colour(x, y, x + container_w, y + container_h,cont_color[c_n--],cont_color[c_n--],cont_color[c_n--],cont_color[c_n--],true);
draw_line_width_colour(x - 1,y + list_y,x + container_w,y + list_y, 2, cont_color[0], cont_color[0]);

//Draw scrollbar
if(can_scroll)
{
  draw_rectangle_colour(scrollbar_x,scrollbar_y,scrollbar_x + scrollbar_w,scrollbar_y + scrollbar_h, scrollbar_draw_col1, scrollbar_draw_col2, scrollbar_draw_col2, scrollbar_draw_col1, false);    
}

//Draw title
if(title != "")
{
  draw_set_font(title_font);
  draw_text_transformed_colour(x + margin, y + margin, string_hash_to_newline(title), title_scale, title_scale, 0, title_col1, title_col2, title_col3, title_col4, 1);
}

//Draw dnd item
if(dnd_index != -1)
{
  this_item = ds_list_find_value(items,dnd_index);
  this_x = this_item.x;
  this_y = this_item.y;
  this_scale = this_item.scale;
  if(item_stretch == false)
  {
    this_scale = 1;
  }     
  if(!is_undefined(this_x))
  {
    draw_rectangle_colour(this_x,this_y,this_x+item_w,this_y+item_h,this_item.color,this_item.color,this_item.color,this_item.color,!this_item.fill);
    if(!is_undefined(this_item.sprite_index))
    {
       draw_sprite_ext(this_item.sprite_index,this_item.image_index,stretch_margin + this_x + this_item.adjust_x,stretch_margin + this_y + this_item.adjust_y,this_scale,this_scale,0,-1,1);
    } 
  } 
  
  //Draw dnd add stuff
  if(!is_undefined(dnd_add_spr))
  {
      draw_sprite(dnd_add_spr, dnd_image_index, this_x + item_w - sprite_get_width(dnd_add_spr) - margin*.25,this_y - margin*.25 - sprite_get_height(dnd_add_spr));
      dnd_add_spr = undefined;
  } 
}


/* */
/*  */
