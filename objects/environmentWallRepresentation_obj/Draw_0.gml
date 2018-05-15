var sprW = sprite_get_width(sprite_index);
var incX = lengthdir_x(sprW, image_angle);
var incY = lengthdir_y(sprW, image_angle);
for(var i = 0; i < image_xscale; i++)
{
  draw_sprite_ext(sprite_index, image_index, x + incX * i, y + incY * i, 1, 1, image_angle, -1, 1); 
}

