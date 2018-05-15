/// @description BackgroundWorkerCreate_scr(script, initScript [optional], endScript [optional], stepTimeMax [optional])
/// @param script
/// @param  initScript [optional]
/// @param  endScript [optional]
/// @param  stepTimeMax [optional]

var i = 0;
var script = argument[i++];

var initScript = undefined;
if(argument_count > i)
{
  initScript = argument[i++]; 
}

var endScript = undefined;
if(argument_count > i)
{
  endScript = argument[i++]; 
}

var stepTimeMax = undefined;
if(argument_count > i)
{
  stepTimeMax = argument[i++]; 
}

var backgroundWorker = instance_create(-1000000, 1000000, backgroundWorker_obj);
backgroundWorker.m_backgroundScript = script;

if(!is_undefined(initScript))
{
  backgroundWorker.m_initScript = initScript;
}

if(!is_undefined(endScript))
{
  backgroundWorker.m_endScript = endScript;
}

if(!is_undefined(stepTimeMax))
{
  backgroundWorker.m_stepTimeMax = stepTimeMax;
}

return backgroundWorker; 


