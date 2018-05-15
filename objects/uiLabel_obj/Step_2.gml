/// @description Set label width and heigh

draw_set_font(labelFont);
var rectWidth = string_width(string_hash_to_newline(text))*labelScaleH; 
var rectHeight = string_height(string_hash_to_newline(text))*labelScaleV;

if(labelAlignH == fa_center)
{
  borderL = x - rectWidth/2 - rectMarginH;
  borderR = x + rectWidth/2 + rectMarginH;
}
else if(labelAlignH == fa_left)
{
  borderL = x - rectMarginH;  
  borderR = x + rectMarginH + rectWidth;
}
else if(labelAlignH == fa_right)
{
  borderL = x - rectMarginH - rectWidth;
  borderR = x + rectMarginH;
}

if(labelAlignV == fa_middle)
{
  borderU = y - rectMarginV - rectHeight/2;
  borderD = y + rectHeight/2 + rectMarginV;
}
else if(labelAlignV == fa_top)
{
  borderU = y - rectMarginV;
  borderD = y + rectHeight + rectMarginV;
}
else if(v_algin == fa_bottom)
{
  borderU = y - rectMarginV - rectHeight;
  borderD = y + rectMarginV;
}

border_rel_l = borderL - x;
border_rel_r = borderR - x;
border_rel_u = borderU - y;
border_rel_d = borderD - y; 

container_w = borderR - borderL;
container_h = borderD - borderU;

obscureOffsetX = x - borderL;
obscureOffsetY = y - borderU;

//mask_index = menu_mask_spr;
//image_xscale = (rectWidth + rectMarginH*2)/mask_w;
//image_yscale = (rectHeight + rectMarginV*2)/mask_h;

//Obscure logic
event_inherited();

if(obscureMode == OBSCURE_MODE_PART)
{
  //x = borderL;
  //y = borderU;
  
  //if(sprite_exists(obscureSpr))
  //{
    //sprite_set_offset(obscureSpr, x - borderL, y - borderU);
  //}
}

