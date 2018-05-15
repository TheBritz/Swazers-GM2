/// @description ConsoleActivateRoomEditor_scr()

var number = instance_number(Editor_obj);

if(number < 1)
{
  instance_create(0, 0, Editor_obj);
}

