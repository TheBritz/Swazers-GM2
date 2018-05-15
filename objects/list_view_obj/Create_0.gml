event_inherited();

///List View init
sound_select = select_snd;
container = noone;

bg_color = -1;
bg_alpha = 0;
dnd_eval_script = undefined;     //Script run to determine whether an item can be added to this list.
dnd_add_spr = undefined;
dnd_image_index = -1;
title = "";
title_font = console_font_sm;
title_scale = 1;
title_col1 = -1;
title_col2 = -1;
title_col3 = -1;
title_col4 = -1;
for(var i = 0; i < 4; i++) {cont_color[i] = -1};
data_val = undefined;
capacity = -1;                   //value of -1 indicates unlimited capacity.
drag_and_drop = false;
selected_index = -1;
dnd_index = -1;
section_sort_script = undefined  //Script reference that determines how a given item is sorted into an item section 
sections = ds_list_create();     //Sections list holds the section names and determines the order sections are listed in
section_h = 32;
items = ds_list_create();
item_w = 64;
item_h = 64;
item_rel_w = undefined;
item_rel_h = undefined;
container_w = 0;
container_h = 0;
list_y = y;
list_cont_w = 0;
list_cont_h = 0;
margin = __view_get( e__VW.WPort, 0 )*.005;
can_scroll = false;
scroll_mod = 0;
scroll_inc = 5;
scroll_item_fraction = 1;        //Value that allows the scroll_inc to be dynamically set according to the weapon height multiplied by this value
scrollbar_w = 16;
scrollbar_h = 0;
scrollbar_y = 0;
scrollbar_x = 0;
scrollbar_drag = false;
scrollbar_grab_y = 0;
scrollbar_col1 = -1;
scrollbar_col2 = -1;
scrollbar_draw_col1 = -1;
scrollbar_draw_col2 = -1;
item_select_event = undefined;   //Script that's called when an item is selected
args[0] = undefined;             //Argument array that is passed as the second argument of the event
item_color = -1;                 //Bg color of item
item_sel_color = -1;             //Bg color of item when selected
item_mouseover_color = -1;       //Bg color of item when moused-over
item_fill = false;               //Bg fill
item_sel_fill = false;           //Bg fill (if no bg sprite used) 
item_bg_spr = undefined;         //Set to sprite to use for custom item background
item_stretch = true;             //Stretch icon sprite across item
item_xoff = 0;
item_yoff = 0;
list_height = 0;
stretch_margin = 0;  
has_focus = false; 

mask_index = dnd_mask_spr;
           

