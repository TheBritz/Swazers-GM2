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
  var editable = editableList[| 0];
  editable.m_selected = true;
}


