var item = argument0;  
var list_from = argument1;
var list_to = argument2;
var item_sw = ds_list_find_value(list_to.items, 0);

ds_list_delete(list_from.items, ds_list_find_index(list_from.items, item));
ds_list_delete(list_to.items, 0);

ds_list_add(list_to.items, item);
ds_list_add(list_from.items, item_sw);

item.parent = list_to;
item_sw.parent = list_from;
