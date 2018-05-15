/// @description Control title draw
if(title != "")
{
    list_y = string_height(string_hash_to_newline(title))*title_scale + margin*2;
}
else
{
    list_y = 0;
}

list_cont_h = container_h - list_y;

///Draw Early Setup
for(var i = 0; i < ds_list_size(items); i++)
{
  var this_item = items[|i];
  if(selected_index != i)
  {
    this_item.color = item_color;
    this_item.fill = item_fill;
  }
}

