/// @description FormsRegisterDrawScript_scr(element, drawScript, layer [optional])
/// @param element
/// @param  drawScript
/// @param  layer [optional]

var element = argument[0];
if(IsLegalFormsElement_scr(element))
{
  with(element)
  {
    var drawScript = argument[1];
    if(argument_count > 2)
    {
      var layer = argument[2];
      ds_list_insert(m_drawScriptList, layer, drawScript);
    }
    else
    {
      ds_list_add(m_drawScriptList, drawScript);
    }
  }
}

