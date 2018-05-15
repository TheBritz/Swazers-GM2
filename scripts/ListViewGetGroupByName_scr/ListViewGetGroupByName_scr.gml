/// @description ListViewGetGroupByName_scr(list, groupName)
/// @param list
/// @param  groupName

var list = argument0;
var groupName = argument1;

var thisGroup;
for(var i = 0; i < ds_list_size(list.listGroups); i++)
{
  thisGroup = list.listGroups[|i];
  if(thisGroup.name == groupName)
  {
    return thisGroup;
    exit;
  }
}

//If no group is found, returned undefined
return undefined;
