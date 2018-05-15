/// @description WeaponGetClipIndex_scr(weaponInstance)
/// @param weaponInstance
//Returns the index position of the next projectile to be fired

var wep = argument0;

var clipIndex = ds_list_size(wep.ammoClip) - 1;

return clipIndex;
