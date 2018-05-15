/// @description FormsRunDrawScripts_scr(x, y)
/// @param x
/// @param  y
var X = argument0;
var Y = argument1;

var drawScript;
for(var i = 0; i < ds_list_size(m_drawScriptList); i++)
{
  drawScript = m_drawScriptList[| i];
  script_execute(drawScript, X, Y);
}
