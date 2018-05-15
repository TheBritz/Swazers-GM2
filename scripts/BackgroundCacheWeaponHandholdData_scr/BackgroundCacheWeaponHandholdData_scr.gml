/// @description BackgroundCacheWeaponHandholdData_spr(index)
/// @param index

var index = argument0;

if(index < ds_list_size(m_spritesToCache))
{
  var thisSprite = m_spritesToCache[| index];
  var progress = 0;
  if(!is_undefined(thisSprite))
  {
    var coords = HandholdGetDataFromSprite_scr(thisSprite);
  
    //Run the handhold analysis
    progress = index / ds_list_size(m_spritesToCache) * 100;
    return array(true, progress);
  }
}
else
{
  ds_list_destroy(m_spritesToCache);
  return array(false, 100);
}
