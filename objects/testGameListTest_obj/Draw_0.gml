draw_set_halign(fa_left);
var yy = y;
var text_h;
for(var i = 0; i < ds_list_size(list); i++)
{
  draw_text_colour(x, yy, string_hash_to_newline(list[|i]), color, color, color, color, image_alpha);
  text_h = string_height(string_hash_to_newline(list[|i]));
  yy += text_h;
}

