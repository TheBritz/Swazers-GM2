/// @description WeaponGetReloadRate_scr(wepInstance)
/// @param wepInstance

var wep = argument0;

with(wep)
{  
  var modMult = 1;
  modMult += ModifiersGetInstanceModifier_scr
    (wep, MODIFIER_RELOAD_RATE_MULT);
  var modPlus = 0;
  modPlus += ModifiersGetInstanceModifier_scr
    (wep, MODIFIER_RELOAD_RATE_PLUS);
  
  if(instance_exists(combatant))
  {
    var classModMap = ModifiersGetClassModifiersComprehensive_scr
     (combatant.object_index, MODIFIER_RELOAD_RATE_PLUS, MODIFIER_RELOAD_RATE_MULT);
    modMult += classModMap[? MODIFIER_RELOAD_RATE_MULT];
    modPlus += classModMap[? MODIFIER_RELOAD_RATE_PLUS];
    ds_map_destroy(classModMap);
  }
  
  var retVal = (m_ammoReloadRate * modMult) + modPlus;
  
  return retVal;
}
