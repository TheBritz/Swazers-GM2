/// @description Cursor GUI Obj select
if(instance_number(object_index) > 1)
{
  instance_destroy();
}
else
{
  global.cursor = id;
  ratio = __view_get( e__VW.WPort, 0 )/__view_get( e__VW.WView, 0 );
  mode = 0;
  sprite_index = undefined;
  mask_index = cursor_mask_spr;
  visible = false;
  holding = false;
  depth = -10000000000000000000000000000;
  window_set_cursor(cr_none); 
  c_cursor[0] = -1;
  c_cursor[1] = -1;
  c_cursor[2] = -1;
  var cursorCoords1 = array(0, 20);
  var cursorCoords2 = array(12, 12);
  cursorCoords[0] = cursorCoords1;
  cursorCoords[1] = cursorCoords2;
  c_outline = false;
  xx = 0;
  yy = 0;
}


