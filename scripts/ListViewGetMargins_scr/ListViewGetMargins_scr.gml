/// @description ListViewGetMargins_scr(list)
/// @param list

var list = argument0;

//Returns an array of the margin values - use MARGIN_ and MARGIN_ITEM_ 
//constants to get values from array
var retArr;

with(list)
{
  //Get the list margins
  if(listViewSettings[? LIST_VIEW_MARGIN_HOR_TYPE] == LIST_VIEW_MARGIN_TYPE_ABS)
  {
    //Margin type is absolute, return the raw value
    retArr[MARGIN_HOR] = listViewSettings[? LIST_VIEW_MARGIN_HOR];
    retArr[MARGIN_VERT] = listViewSettings[? LIST_VIEW_MARGIN_HOR];
  }
  else
  {
    //Margin type is relative, return the values relative to list dimensions
    retArr[MARGIN_HOR] = listViewSettings[? LIST_VIEW_MARGIN_HOR] * container_w;
    retArr[MARGIN_VERT] = listViewSettings[? LIST_VIEW_MARGIN_VERT] * container_h;
  }
  
  //Get the item margins
  if(listViewSettings[? LIST_VIEW_MARGIN_ITEM_HOR_TYPE] == LIST_VIEW_MARGIN_TYPE_ABS)
  {
    //Margin type is absolute, return the raw value
    retArr[MARGIN_HOR] = listViewSettings[? LIST_VIEW_MARGIN_ITEM_HOR];
    retArr[MARGIN_VERT] = listViewSettings[? LIST_VIEW_MARGIN_ITEM_HOR];
  }
  else
  {
    //Margin type is relative, return the values relative to list dimensions
    retArr[MARGIN_HOR] = listViewSettings[? LIST_VIEW_MARGIN_ITEM_HOR] * container_w;
    retArr[MARGIN_VERT] = listViewSettings[? LIST_VIEW_MARGIN_ITEM_VERT] * container_h;
  }
  
  return retArr;
}
