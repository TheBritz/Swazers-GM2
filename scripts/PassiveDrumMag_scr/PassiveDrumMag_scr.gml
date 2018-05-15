/// @description PassiveDrumMag_scr(pickerUpper, pickupOrDrop)
/// @param pickerUpper
/// @param  pickupOrDrop

var pickerUpper = argument0;
var pickupOrDrop = argument1;

if(instance_exists(pickerUpper))
{
  with(pickerUpper)
  {
    m_ammoClipSizeModMult += (.3 * pickupOrDrop);
  }
}




