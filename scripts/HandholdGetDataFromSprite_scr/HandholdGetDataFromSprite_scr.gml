/// @description HandholdGetDataFromSprite_scr(sprite)
/// @param sprite
var sprite = argument0;

var width = sprite_get_width(sprite);
var height = sprite_get_height(sprite);

var handholdColors = global.HandholdColors;

var retArray;
retArray[array_length_1d(handholdColors) - 1] = undefined;
var numberFound = 0;

//Create a surface for analytical purposes
var surf = surface_create(width, height);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite(sprite, 0, 0, 0);
surface_reset_target();

var pixelColor, handholdColor;
for(var iW = 0; iW < width; iW++)
{
  for(var iH = 0; iH < height; iH++)
  {
    pixelColor = surface_getpixel(surf, iW, iH);
    for(var i = 0; i < array_length_1d(handholdColors); i++)
    {
      handholdColor = handholdColors[i];
      if(pixelColor == handholdColor)
      {
        retArray[i] = array(iW, iH);
        numberFound++;
        if(numberFound == array_length_1d(handholdColors))
        {
          surface_free(surf);
          return retArray;
        }
      }
    }
  }
}

surface_free(surf);
return retArray;
