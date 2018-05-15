/// @description Log_scr(logString, logName [optional])
/// @param logString
/// @param  logName [optional]

if(global.LogEnabled)
{
  var logString = argument[0];
  var logName = "log.txt";
  if(argument_count > 1)
  {
    logName = argument[1];
  }
  
  if(!ds_map_exists(global.LogMap, logName))
  {
    var test = working_directory;
    global.LogMap[? logName] = file_text_open_append("Logs\\" + logName); 
  }
  
  if(instance_number(LoggerCloseListener_obj) == 0)
  {
    instance_create(x, y, LoggerCloseListener_obj);
  }
  
  var log = global.LogMap[? logName]; 
  
  var currentTime = date_current_datetime();
  var year = date_get_year(currentTime);
  var dayOfYear = date_get_day_of_year(currentTime);
  var hour = date_get_hour(currentTime);
  var minute = date_get_minute(currentTime);
  var second = date_get_second(currentTime);
  
  var timeStamp = string(year) + ":" + string(dayOfYear) + ":" + string(hour) + ":" + string(minute) + ":" + string(second);
  
  file_text_write_string(log, timeStamp + " - " + logString);
  file_text_writeln(log);
}
