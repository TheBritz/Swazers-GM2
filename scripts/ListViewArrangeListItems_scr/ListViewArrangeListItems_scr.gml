/// @description ListViewArrangeListItems_scr(list)
/// @param list

var list = argument0;

with(list)
{
  //Declare utility variables
  var xx, yy, item, rowDisplay, rowItemNumber, rowItemSize, itemSpaceWidth, itemSpaceHeight;
  var slotWidth, slotHeight, slotMarginWidth, columnIndex;
  
  //Get the list's margin values
  var margins = ListViewGetMargins_scr(id);
  
  //Get the item space dimensions
  itemSpaceWidth = container_w - margins[MARGIN_HOR]*2;
  itemSpaceHeight = container_h - margins[MARGIN_VERT]*2;
  
  //Get the row display type
  rowDisplay = listViewSettings[? LIST_VIEW_DISPLAY_ITEMS_PER_ROW];
  
  //Set the position variables to their starting place
  xx = margins[MARGIN_HOR];
  yy = margins[MARGIN_VERT];
  
  //Iterate through the item groups
  var group;
  if(rowDisplay == ROW_DISPLAY_TYPE_ITEM_NUM)
  {
    rowItemNumber = listViewSettings[? LIST_VIEW_DISPLAY_ITEMS_PER_ROW];
    rowItemSize = listViewSettings[? LIST_VIEW_ROW_DISPLAY_ITEM_SIZE];
    slotWidth = itemSpaceWidth / rowItemNumber;
    rowItemWidth = rowItemSize * (slotWidth - margins[MARGIN_ITEM_HOR]*2);
    slotMarginWidth = (slotWidth - rowItemWidth)/2;
    for(var i = 0; i < ds_list_size(listGroups); i++) 
    {
      //Set group position
      group = listGroups[|i];
      group.cont_abs_posx = xx;
      group.cont_abs_posy = yy;
      //There will be one group per "row" - increment our y position
      yy += group.container_w + margins[MARGIN_ITEM_VERT]*2;
      
      //Arrange this group's items
      columnIndex = 0;
      for(var ii = 0; ii < ds_list_size(group.items); ii++)
      {
        //Get item and set its positional data
        item = group.items[|ii]; 
        item.container_w = rowItemWidth;
        item.cont_abs_posx = xx + slotMarginWidth;
        item.cont_abs_posy = yy; 
        
        columnIndex++;
        if(columnIndex >= rowItemNumber)
        {
          yy += item.container_h + margins[MARGIN_ITEM_VERT]*2;
        }
      }
    }
  }
  else
  {
  }
}


