/// @description ProjApplyModifiers_scr(projectileInstance)
/// @param projectileInstance
var proj = argument0;

with(proj)
{
  //Get the list of class modifiers for the projectile
  var modifiers = ModifiersGetClassModifiersComprehensive_scr(id.object_index,
    MODIFIER_SPD_START_MULT, MODIFIER_SPD_START_PLUS, MODIFIER_SPD_START_PLUS_DYN,
    MODIFIER_SPD_MAX_MULT, MODIFIER_SPD_MAX_PLUS, MODIFIER_SPD_MAX_PLUS_DYN,
    MODIFIER_DMG_MULT, MODIFIER_DMG_PLUS, MODIFIER_DMG_PLUS_DYN);
  var projSpeedStartModMult = 1 + modifiers[? MODIFIER_SPD_START_MULT];
  var projSpeedStartModPlus = modifiers[? MODIFIER_SPD_START_PLUS];
  var projSpeedStartModPlusDyn = modifiers[? MODIFIER_SPD_START_PLUS_DYN];
  
  var projSpeedMaxModMult = 1 + modifiers[? MODIFIER_SPD_MAX_MULT];
  var projSpeedMaxModPlus = modifiers[? MODIFIER_SPD_MAX_PLUS];
  var projSpeedMaxModPlusDyn = modifiers[? MODIFIER_SPD_MAX_PLUS_DYN];
  
  var projDamageModMult = 1 + modifiers[? MODIFIER_DMG_MULT];
  var projDamageModPlus = modifiers[? MODIFIER_DMG_PLUS];
  var projDamageModPlusDyn = modifiers[? MODIFIER_DMG_PLUS_DYN];
  
  ds_map_destroy(modifiers);
  
  //Incorporate modifiers from the projectile's weapon
  modifiers = ModifiersGetClassModifiersComprehensive_scr(m_weapon.object_index,
    MODIFIER_SPD_START_MULT, MODIFIER_SPD_START_PLUS, MODIFIER_SPD_START_PLUS_DYN,
    MODIFIER_SPD_MAX_MULT, MODIFIER_SPD_MAX_PLUS, MODIFIER_SPD_MAX_PLUS_DYN,
    MODIFIER_DMG_MULT, MODIFIER_DMG_PLUS, MODIFIER_DMG_PLUS_DYN);
    
  projSpeedStartModMult += modifiers[? MODIFIER_SPD_START_MULT];
  projSpeedStartModPlus += modifiers[? MODIFIER_SPD_START_PLUS];
  
  projSpeedMaxModMult += modifiers[? MODIFIER_SPD_MAX_MULT];
  projSpeedMaxModPlus += modifiers[? MODIFIER_SPD_MAX_PLUS];
  
  projDamageModMult += modifiers[? MODIFIER_DMG_MULT];
  projDamageModPlus += modifiers[? MODIFIER_DMG_PLUS];
  
  ds_map_destroy(modifiers);
  
  //Incorporate modifiers from the combatant - if the combatant exists.
  if(instance_exists(m_weapon.combatant))
  {
    //Get the list of class modifiers for the projectile
    modifiers = ModifiersGetClassModifiersComprehensive_scr(m_weapon.combatant.object_index,
      MODIFIER_SPD_START_MULT, MODIFIER_SPD_START_PLUS, MODIFIER_SPD_MAX_MULT, 
      MODIFIER_SPD_MAX_PLUS, MODIFIER_DMG_MULT, MODIFIER_DMG_PLUS);
    
    projSpeedStartModMult += modifiers[? MODIFIER_SPD_START_MULT];
    projSpeedStartModPlus += modifiers[? MODIFIER_SPD_START_PLUS];
    
    projSpeedMaxModMult += modifiers[? MODIFIER_SPD_MAX_MULT];
    projSpeedMaxModPlus += modifiers[? MODIFIER_SPD_MAX_PLUS];
    
    projDamageModMult += modifiers[? MODIFIER_DMG_MULT];
    projDamageModPlus += modifiers[? MODIFIER_DMG_PLUS];
    
    ds_map_destroy(modifiers);
  }
  
  //Apply fully-incorporated modifiers
  speed *= projSpeedStartModMult;
  speed += projSpeedStartModPlus;
  
  if(!is_undefined(speedMax))
  {
    speedMax *= projSpeedMaxModMult;
    speedMax += projSpeedMaxModPlus;
  }
  
  m_damage += projDamageModPlusDyn;
  m_damage *= projDamageModMult;
  m_damage += projDamageModPlus; 
}
