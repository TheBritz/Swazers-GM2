if(m_showList)
{
  var X = 12;
  var Y = 12;
  var vertSpace = 20;
  var listIndex = m_currentPage * m_listPageDisplay;
  var script, scriptIndex;
  for(var i = 0; i < 9; i++)
  {
    scriptIndex = listIndex + i;
    if(scriptIndex < ds_list_size(m_debuggerList))
    {
      script = m_debuggerList[| scriptIndex];
      draw_text_colour(X, Y, string_hash_to_newline(string(i + 1) + " - " + script_get_name(script)), c_purple, c_purple, c_purple, c_purple, 1);
      Y += vertSpace;
    }
  }
}



