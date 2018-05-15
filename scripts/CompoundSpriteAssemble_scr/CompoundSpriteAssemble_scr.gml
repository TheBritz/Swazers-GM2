/// @description CompoundSpriteAssemble_scr(sprite, maxLayers, color1 [optional], color2 [optional], color3 [optional]...)
/// @param sprite
/// @param  maxLayers
/// @param  color1 [optional]
/// @param  color2 [optional]
/// @param  color3 [optional]...

var spr = argument[0];
var maxLayers = argument[1];
var colorArray;
if(is_array(argument[2]))
{
  colorArray = argument[2]; 
}
else
{
  for(var i = 2; i < argument_count; i++)
  {
    colorArray[i - 2] = argument[i];
  }
}

var sprName = sprite_get_name(spr);
if(string_pos("Layer", sprName) != 0)
{
  var spriteList = ds_list_create();
  ds_list_add(spriteList, spr);
  var sprNameCore = string_replace(sprName, "_spr", "");
  var tempArr = split(sprName, "Layer");
  var sprNameBase = tempArr[0];
  var layerNumberStr = tempArr[1];
  var layerNumber = real(string_digits(layerNumberStr));
  while(true)
  {
    layerNumber++;
    var thisSpriteName = sprNameCore + "Layer" + string(layerNumber) + "_spr";
    spr = asset_get_index(thisSpriteName);
    if(sprite != -1)
    {
      ds_list_add(spriteList, spr);
    }
    else
    {
      break;
    }
  }
  
  spr = spriteList[|0];
  var origX = sprite_get_xoffset(spr);
  var origY = sprite_get_yoffset(spr);
  var w = sprite_get_width(spr);
  var h = sprite_get_height(spr);
  var workingSurf = surface_create(w, h);
  var compoundSurf = surface_create(w, h);
  var color = -1;
  var alpha = 1;
  for(var i = 0; i < ds_list_size(spriteList); i++)
  {
    surface_set_target(workingSurf);
    d3d_set_fog(true, c_white, 0, 0);
    surface_reset_target();
    surface_set_target(compoundSurf);
    
    if(array_length_1d(colorArray) > i)
    {
      color = colorArray[i];
    }
    else
    {
      color = -1;
    }
    
    draw_surface_ext(workingSurf, x, y, 1, 1, 0, color, alpha);
    surface_reset_target();
    surface_set_target(workingSurf);
    draw_clear_alpha(-1, 0);
    surface_reset_target();
  }
  
  sprite_create_from_surface(compoundSurf, 0, 0, w, h, true, false, origX, origY);
  ds_list_destroy(spriteList);
}
