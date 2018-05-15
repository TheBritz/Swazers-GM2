/// @description WeaponReloadBasic_scr(ammoCapacity)
/// @param ammoCapacity

var ammoCapacity = argument0;
ds_list_clear(ammoClip);

if(ds_list_size(ammoProjectileTypes) >= 1)
{
  var proj = ammoProjectileTypes[|0];
  
  for(var i = 0; i < ammoCapacity; i++)
  {
    var index = irandom(ds_list_size(ammoProjectileTypes) - 1);
    ds_list_add(ammoClip, ammoProjectileTypes[|index]);
  }
}

