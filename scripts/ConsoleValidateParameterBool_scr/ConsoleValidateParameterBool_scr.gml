/// @description ConsoleValidateParameterBool_scr(value)
/// @param value

var value = argument0;
var valueTrimmed = string_replace_all(value, " ", "");

if(string_lower(valueTrimmed) == "true" || valueTrimmed == "1")
{
  return true;
}
else if(string_lower(valueTrimmed) == "false" || valueTrimmed == "0")
{
  return false;
}
else
{
  //Value is not valid; return undefined
  return undefined;
}
