event_inherited();

drawScript = UIDrawButton_scr;

selection_group = undefined;

v_align = fa_middle;
h_align = fa_center;
screen_room_wratio = window_get_width()/room_width// global.screen_width/room_width;
screen_room_hratio = window_get_height()/room_height //global.screen_height/room_height;
type = -1;
my_color = make_colour_rgb(150,0,0);
cursorObject = undefined;
mouseover_color = undefined;
selection_color = undefined;
mouseover = false;
checkable = false;
selected = false;
text_color = my_color;
rect_margin = 8;
unselected = true;
rect_width = 0;
rect_height = 0;
scale = 1;
my_font = font0;
border_l = 0;
border_r = 0;
border_u = 0;
border_d = 0;
border_rel_l = 0;
border_rel_r = 0;
border_rel_u = 0;
border_rel_d = 0; 

text = "";
mask_w = sprite_get_width(menu_mask_spr);
mask_h = sprite_get_height(menu_mask_spr);
my_script = undefined;
my_args = undefined;
mouseover_script = undefined;
mouseover_args = undefined;
unselect_script = undefined;
unselect_args = undefined;
manager = noone;


