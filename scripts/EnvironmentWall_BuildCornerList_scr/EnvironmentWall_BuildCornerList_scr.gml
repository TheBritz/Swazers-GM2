/// @description EnvironmentWall_BuildCornerList_scr(sizeModifier, setExtremities)
/// @param sizeModifier
/// @param  setExtremities
var list = ds_list_create();
var sizeExt = argument[0];
var setExtremities = false;
if(argument_count > 1)
{
  setExtremities = argument[1];
}
 
//Get the actual width and height
var width = round(image_xscale * sprite_get_width(sprite_index) + sizeExt - abs(sizeExt)*.25);
var height = round(image_yscale * sprite_get_height(sprite_index) + sizeExt - abs(sizeExt)*.25);

//Get the top left corner
var coords;
var cornerX = x + lengthdir_x(sprite_xoffset + sizeExt/2, image_angle + 180);
var cornerY = y + lengthdir_y(sprite_xoffset + sizeExt/2, image_angle + 180);
cornerX = cornerX + lengthdir_x(sprite_yoffset + sizeExt/2, image_angle + 90);
cornerY = cornerY + lengthdir_y(sprite_yoffset + sizeExt/2, image_angle + 90);
coords = array(cornerX, cornerY);
ds_list_add(list, coords);

if(setExtremities)
{
  var extremityLeft = cornerX;
  var extremityRight = cornerX;
  var extremityUp = cornerY;
  var extremityDown = cornerY;
}

//Get the remaining points
var rotateVal = -90;
var widthHeightArr = array(width, height, width);
for(var i = 0; i < 3; i++)
{
  coords = list[|i];
  cornerX = coords[0] + lengthdir_x(widthHeightArr[i], image_angle + (rotateVal * i));
  cornerY = coords[1] + lengthdir_y(widthHeightArr[i], image_angle + (rotateVal * i));
  coords = array(cornerX, cornerY);
  ds_list_add(list, coords);
  
  if(setExtremities)
  {
    if(cornerX < extremityLeft)
    {
      extremityLeft = cornerX;
    }
    else if(cornerX > extremityRight)
    {
      extremityRight = cornerX;
    }
    
    if(cornerY < extremityUp)
    {
      extremityUp = cornerY;
    }
    else if(cornerY > extremityDown)
    {
      extremityDown = cornerY;
    }
  }
}

if(setExtremities)
{
  m_extremityLeft = extremityLeft;
  m_extremityRight = extremityRight;
  m_extremityUp = extremityUp;
  m_extremityDown = extremityDown;
}

return list;
