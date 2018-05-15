/// @description ListViewArrangeItems_scr(item_list, x_start, y_start)
/// @param item_list
/// @param  x_start
/// @param  y_start

var this_item;
var item_list = argument0;
var xx = argument1;
var yy = argument2;

for(var i = 0; i < ds_list_size(item_list); i++;)
{
  if(xx + item_w > list_cont_w)
  {
    xx = margin;
    yy = yy + item_h + margin;
  }
     
  this_item = ds_list_find_value(item_list,i);
  
  this_item.x = x + xx;
  this_item.y = y + yy;
  
  xx = xx + item_w + margin;
  
  if(object_is(this_item.object_index, ui_container_obj))
  {
    this_item.container_w = item_w;
    this_item.container_h = item_h;
  }
  
  this_item.draw_rect_h = item_h;
  this_item.draw_rect_y = this_item.y;
  if(yy + item_h > list_cont_h + list_y)
  {
    //this_item.draw_rect_y = undefined;
    if(yy > list_cont_h + list_y)
    {
      this_item.x = NOT_A_VALUE;
    }
    else
    {
      this_item.draw_rect_h = list_cont_h - yy + list_y;
    }
  }
  else if(yy < list_y)
  {
    if(yy + item_h < list_y)
    {
      this_item.x = NOT_A_VALUE;
    }
    else
    {
      //this_item.draw_rect_h = undefined;
      this_item.draw_rect_y = y + list_y;
      this_item.draw_rect_h = yy + item_h - list_y;
    }
  }
  else
  {
    //this_item.draw_rect_h = undefined;
    //this_item.draw_rect_y = undefined;
  }
}



return(array(xx,yy));
