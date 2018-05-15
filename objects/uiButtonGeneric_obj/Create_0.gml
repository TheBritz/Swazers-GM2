event_inherited();

cursorObject = uiCursorGeneric_obj;

if(!instance_exists(cursorObject))
{
  instance_create(window_mouse_get_x(), window_mouse_get_y(), cursorObject);
}


