if(keyboard_check_pressed(192))
{
  if(!m_showList)
  {
    m_showList = true;
  }
  else
  {
    m_showList = false;
  }
}

if(keyboard_key > 0)
{
  //Run the debugger script associated with the button pressed
  var keyNumber = keyboard_key - 48;
  if(keyNumber > 0 && keyNumber <= m_listPageDisplay)
  {
    var scriptIndex = keyNumber + m_listPageDisplay * m_currentPage - 1;
    if(scriptIndex < ds_list_size(m_debuggerList))
    {
      var script = m_debuggerList[| scriptIndex];
      script_execute(script);
      m_showList = false;
    }
  }
}
else
{
  DebugSetPressMap_scr(keyPressMap, false);
}

