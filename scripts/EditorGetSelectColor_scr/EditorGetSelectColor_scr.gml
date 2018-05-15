/// @description EditorGetSelectionColor_scr()

var editor = EditorGetInstance_scr();
if(instance_exists(editor))
{
  return editor.m_selectColor;
}
else
{
  return undefined;
}
