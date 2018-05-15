/// @description PassivePurplePowder_scr(pickerUpper, pickupOrDrop)
/// @param pickerUpper
/// @param  pickupOrDrop

var pickerUpper = argument0;
var pickupOrDrop = argument1;

//Apply 
ModifiersIncrementCombatantProjectileClassModifier_scr(pickerUpper, 
  projectileBulletBase_obj, MODIFIER_DMG_MULT, .2 * pickupOrDrop);
