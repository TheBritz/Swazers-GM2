/// @description ConsoleEnableLogging_scr(enable)
/// @param enable

var enable = argument0;

global.LogEnabled = enable;

if(enable)
{
  PrintConsoleLine_scr("Logging Enabled.");
}
else
{
  PrintConsoleLine_scr("Logging Disabled.");
}





