/// @description Init
event_inherited();
fireRate = 14;
fireScript = FireTest_scr;
m_ammoReloadRate = room_speed*2;

ammoProjNumber = 1;
fireDispersion = WeaponCreateFireDispersionArray_scr(-6, 6);
fireMuzzleOrigin = WeaponCreateMuzzleOriginArray_scr(35, -6);
m_ammoClipSize = 100;
ammoProjectileTypes[|0] = projectileLaser_obj;
WeaponReloadBasic_scr(WeaponGetClipCapacity_scr(id));



