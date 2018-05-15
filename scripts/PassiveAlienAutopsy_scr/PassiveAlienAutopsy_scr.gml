/// @description PassiveAlienAutopsy_scr(pickerUpper, pickupOrDrop)
/// @param pickerUpper
/// @param  pickupOrDrop

var pickerUpper = argument0;
var pickupOrDrop = argument1;

ModifiersIncrementClassModifier_scr
  (playerBase_obj, MODIFIER_DMG_PLUS, 2 * pickupOrDrop);
