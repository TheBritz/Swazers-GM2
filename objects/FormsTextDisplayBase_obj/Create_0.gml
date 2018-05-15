/// @description Text Display Base Init
//This object type is the base type for all types for which text is the
//defining feature e.g. labels, buttons, textboxes
event_inherited();
FormsRegisterDrawScript_scr(id, FormsButtonDefaultDrawScript_scr);

enum TextFitWidthModes
{
  FitWidthToText,
  FitTextToWidth,
  CutTextOff
}
m_textFitWidthMode = TextFitWidthModes.FitWidthToText;
m_textIsWidthCheckNeeded = true;

