/// @description WeaponGetClipCapacity_scr(weaponInstance)
/// @param weaponInstance

var weaponInstance = argument0;

with(weaponInstance)
{
  var modMult = 1 + m_ammoClipSizeModMult
  var modPlus = m_ammoClipSizeModPlus;
  
  if(instance_exists(combatant))
  {
    var classModMap = ModifiersGetClassModifiersComprehensive_scr
     (combatant.object_index, MODIFIER_CLIP_CAP_PLUS, MODIFIER_CLIP_CAP_MULT);
    modMult += classModMap[? MODIFIER_CLIP_CAP_PLUS];
    modPlus += classModMap[? MODIFIER_CLIP_CAP_MULT];
    ds_map_destroy(classModMap);
  }
  
  var clipSize = round(m_ammoClipSize * modMult) + modPlus;
  
  return clipSize;
}
