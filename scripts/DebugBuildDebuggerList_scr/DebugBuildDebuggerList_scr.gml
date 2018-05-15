/// @description DebugBuildDebuggerList_scr()

var name;
for(var i = 0; i < 2000; i++)
{
  name = script_get_name(i);
  if(string_pos("Debugger", name) == 1)
  {
    ds_list_add(m_debuggerList, i);
  }
}
