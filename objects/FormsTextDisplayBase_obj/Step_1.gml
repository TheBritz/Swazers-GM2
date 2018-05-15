/// @description Peform fitting actions

if(m_textIsWidthCheckNeeded)
{
  var textWidth = string_width(string_hash_to_newline(m_text));
  if(textWidth > FormsGetContainerWidth_scr(id))
  {
    FormsSetContainerWidth_scr(id, textWidth);
  }
}



