/// @description Perform background script
//for as many iterations as possible
var timeStart = current_time;
var data = undefined;
var ongoing = true;
//Check to make sure that we haven't gone over the max time for this step
//If we have, stop executing for this step and pick up where we left off
var timeTest;
var indexStart = m_index;
while(current_time - timeStart < m_stepTimeMax && ongoing)
{
  timeTest = current_time;
  if(!is_undefined(m_backgroundScript))
  {
    data = script_execute(m_backgroundScript, m_index++);
    if(is_array(data))
    {
      ongoing = data[0];
      m_progress = data[1];
    }
  }
}
var indexEnd = m_index;

if(debug_mode)
{
  //trace("Ran from index ", indexStart, " to ", indexEnd);  
  trace("Progress: " + string(m_progress) + "%");  
}

if(is_array(data) && !data[0])
{
  //Background process has completed, terminate this background worker
  instance_destroy();
}

