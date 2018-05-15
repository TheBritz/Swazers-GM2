/// @description Cache the drawing data
//Clear the cache
ds_list_clear(m_cacheList);

if(m_visible && instance_exists(m_playerInstance))
{
  var statArr, statIcon, statScript, statValue;
  for(var i = 0; i < ds_list_size(m_statsList); i++)
  {
    statArr = m_statsList[| i];
    statIcon = statArr[0];
    statScript = statArr[1];
    
    statValue = script_execute(statScript, m_playerInstance);
    ds_list_add(m_cacheList, array(statIcon, statValue)); 
  }
}

