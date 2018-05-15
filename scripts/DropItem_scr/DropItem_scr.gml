var item = argument0;  
var list_from = argument1;
var list_to = argument2;

ds_list_delete(list_from.items, ds_list_find_index(list_from.items, item));
ds_list_add(list_to.items, item);

//Search to remove from sections
var this_list, this_item, item_ind;
for(var i = 0; i < ds_list_size(sections); i++)
{
    item_ind = ds_list_find_index(sections[|i].items, item);
    if(item_ind != -1)
    {
        ds_list_delete(sections[|i].items, item_ind);
    }
}

item.parent = list_to;
