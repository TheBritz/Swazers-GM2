/// @description BackgroundIdentifyHandHoldSprites_scr(index)
/// @param index
var index = argument0;

if(index == 0)
{
  //Perform initialization stuff
  m_spritesToCache = ds_list_create();
}

if(index < assetSpriteEnd_spr)
{
  var spriteName = sprite_get_name(index);
  if(!is_undefined(spriteName))
  {
    if(string_pos("Handholds_spr", spriteName) != 0)
    { 
      ds_list_add(m_spritesToCache, index);
    }
  }
  var progress = index / assetSpriteEnd_spr * 100;
  return array(true, progress); 
}
else
{
  //Terminate - this process kicks off another Background Worker that finishes
  //processing these handhold sprites.
  var worker = BackgroundWorkerCreate_scr(BackgroundCacheWeaponHandholdData_scr);
  worker.m_spritesToCache = m_spritesToCache;
  return array(false, 100);
}
