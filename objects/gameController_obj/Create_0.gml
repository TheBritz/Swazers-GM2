if(instance_number(object_index) > 1)
{
  instance_destroy();
  exit;
}

InitializeGlobals_scr();
InitializeControls_scr();
//global.Debugger = instance_create(x, y + sprite_height, debug_obj);
global.Console = instance_create(x, y + sprite_height, console_obj);
instance_create(x, y, ipProbe_obj);

//Mouse monitoring
m_mouseMoved = false;
m_mouseX = window_mouse_get_x();
m_mouseY = window_mouse_get_y();



