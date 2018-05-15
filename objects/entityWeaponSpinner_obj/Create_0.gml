/// @description Init
event_inherited();
fireRate = 8;
fireScript = FireSpinnerTest_scr;
muzzleOrigin = array(35, -6);
m_ammoClipSize = 20;
ammoProjectileTypes[|0] = projectileSpinner_obj;
WeaponReloadBasic_scr(WeaponGetClipCapacity_scr(id));

ammoProjNumberMap = ds_map_create();
ds_map_add(ammoProjNumberMap, projectileSpinner_obj, 1);

fireDispersionMap = ds_map_create();
fireDispersionMap[?projectileSpinner_obj] =
  WeaponCreateFireDispersionArray_scr(-3, 3);

m_ammoReloadRate = room_speed;

