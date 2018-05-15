//Display setting to choose how many items get displayed on one "row"
listViewSettings[? LIST_VIEW_ROW_DISPLAY_TYPE] = ROW_DISPLAY_TYPE_ITEM_NUM;
listViewSettings[? LIST_VIEW_DISPLAY_ITEMS_PER_ROW] = 1;
listViewSettings[? LIST_VIEW_ROW_DISPLAY_ITEM_SIZE_TYPE] = ROW_DISPLAY_ITEM_SIZE_REL;
listViewSettings[? LIST_VIEW_ROW_DISPLAY_ITEM_SIZE] = .8;

//Display setting to choose how wide items are - if horizontal scroll is not
//enabled, list will automatically adjust how many items are displayed per row
//according to the width
listViewSettings[? LIST_VIEW_DISPLAY_ITEM_WIDTH] = undefined;

//Display setting for how high items are
listViewSettings[? LIST_VIEW_DISPLAY_ITEM_HEIGHT] = undefined;

//Display settings for allowing the list to scroll
listViewSettings[? LIST_VIEW_DISPLAY_ALLOW_SCROLL_HOR] = false;
listViewSettings[? LIST_VIEW_DISPLAY_ALLOW_SCROLL_VERT] = true;

//Selection
listViewSettings[? LIST_VIEW_SELECTION_SETTING] =  
  LIST_VIEW_SELECTION_SINGLE_SELECT;

//Multi-select keys
listViewSettings[? LIST_VIEW_SELECTION_ADD_KEY] = vk_control;
listViewSettings[? LIST_VIEW_SELECTION_RANGE_KEY] = vk_shift;

//Margin - list
listViewSettings[? LIST_VIEW_MARGIN_VERT_TYPE] = 
  LIST_VIEW_MARGIN_TYPE_REL_LIST;
listViewSettings[? LIST_VIEW_MARGIN_HOR_TYPE] = 
  LIST_VIEW_MARGIN_TYPE_REL_LIST;
listViewSettings[? LIST_VIEW_MARGIN_VERT] = .01
listViewSettings[? LIST_VIEW_MARGIN_HOR] = .01;
  
//Margin - item
listViewSettings[? LIST_VIEW_MARGIN_ITEM_VERT_TYPE] = 
  LIST_VIEW_MARGIN_TYPE_REL_LIST;
listViewSettings[? LIST_VIEW_MARGIN_ITEM_HOR_TYPE] = 
  LIST_VIEW_MARGIN_TYPE_REL_LIST;
listViewSettings[? LIST_VIEW_MARGIN_ITEM_VERT] = .005;
listViewSettings[? LIST_VIEW_MARGIN_ITEM_HOR] = .005;
