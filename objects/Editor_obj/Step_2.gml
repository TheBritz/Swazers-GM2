/// @description Select editable objects
x = mouse_x;
y = mouse_y;
var editableList = instance_place_list(x, y, Editable_obj, 1000);
var ctrlPressed = keyboard_check(vk_control);
var shiftPressed = keyboard_check(vk_shift);

if(ctrlPressed && shiftPressed)
{
  for(var i = 0; i < ds_list_size(editableList); i++)
  {
    var editable = editableList[| i];
    editable.m_selected = true;
  }
}
else if(ctrlPressed)
{
  
}
else
{
  if(ds_list_size(editableList) > 0)
  {
    var editable = editableList[| 0];
    editable.m_selected = true;
  }
}


///Select any object
x = mouse_x;
y = mouse_y;
var collisionList = ds_list_create();
for(var i = 0; i < ds_list_size(m_objectList); i++)
{
  var object = m_objectList[| i];
  instance_place_list(x, y, object, 1000, false, collisionList, false);
}

var ctrlPressed = keyboard_check(vk_control);
var shiftPressed = keyboard_check(vk_shift);

if(ctrlPressed && shiftPressed)
{
  for(var i = 0; i < ds_list_size(collisionList); i++)
  {
    var editable = collisionList[| i];
    editable.m_selected = true;
  }
}
else if(ctrlPressed)
{
  
}
else
{
  if(ds_list_size(collisionList) > 0)
  {
    var editable = collisionList[| 0];
    editable.m_selected = true;
    ds_list_clear(m_selectedList);
    ds_list_add(m_selectedList, editable);
  }
}
ds_list_destroy(collisionList);

///Get Corners of each selected object instance
//This take into account rotation and scaling

var instance;
for(var i = 0; i < ds_list_size(m_selectedList); i++)
{
  instance = m_selectedList[| i];
  with(instance)
  {
    //Get the top left corner
    //Check to see if a corners list already exists for this instance
    var corners;
    if(ds_map_exists(other.m_instanceCornersMap, id))
    {
      corners = other.m_instanceCornersMap[? id];
      ds_list_clear(corners);
    }
    else
    {
      corners = ds_list_create();
      ds_map_add(other.m_instanceCornersMap, id, corners);
    }
    var coords;
    var leftX = x + lengthdir_x(sprite_xoffset, image_angle + 180);
    var leftY = y + lengthdir_y(sprite_xoffset, image_angle + 180);
    var cornerX = leftX + lengthdir_x(sprite_yoffset, image_angle + 90);
    var cornerY = leftY + lengthdir_y(sprite_yoffset, image_angle + 90);
    coords = array(cornerX, cornerY);
    ds_list_add(corners, coords);
    
    //Get the remaining points
    var rotateVal = -90;
    var widthHeightArr = array(sprite_width, sprite_height, sprite_width);
    for(var n = 0; n < 3; n++)
    {
      coords = corners[|n];
      cornerX = coords[0] + lengthdir_x(widthHeightArr[n], image_angle + (rotateVal * n));
      cornerY = coords[1] + lengthdir_y(widthHeightArr[n], image_angle + (rotateVal * n));
      coords = array(cornerX, cornerY);
      ds_list_add(corners, coords);
    }   
  }
}

