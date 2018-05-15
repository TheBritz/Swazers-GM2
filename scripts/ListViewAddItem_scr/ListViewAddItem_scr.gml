/// @description ListViewAddItem_scr(listItem, list, groupName [optional])
/// @param listItem
/// @param  list
/// @param  groupName [optional]

var i = 0;
var listItem = argument[i++];
var list = argument[i++];

var groupName = undefined;
if(argument_count > i)
{
  groupName = argument[i];
}

//Check if the group value was passed in
if(!is_undefined(groupName))
{
  //No group value, add it to the list's base group
  ds_list_add(list.baseGroup.items, listItem);
}
else
{
  //Add item to the list by the group name given
  var group = ListViewGetGroupByName_scr(list, groupName);
  ds_list_add(group.items, listItem);
}

//Set items container to this list
item.container = list;
list.listContentsChanged = true;
