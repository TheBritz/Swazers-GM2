/// @description Init
event_inherited();
fireRate = 6;
fireScript = FireTest_scr;
m_ammoReloadRate = room_speed;

m_muzzleFlash = MuzzleFlashAssaultRifle_obj;
ammoProjNumber = 1;
m_casingEjectOrigin = WeaponCreateMuzzleOriginArray_scr(7, -7);
fireDispersion = WeaponCreateFireDispersionArray_scr(-3, 3);
fireMuzzleOrigin = WeaponCreateMuzzleOriginArray_scr(50, -7);
m_ammoClipSize = 30;
ammoProjectileTypes[|0] = projectileTest_obj;
WeaponReloadBasic_scr(WeaponGetClipCapacity_scr(id));
var args = array(casing_obj, -1.75, -.05, -.4, .4, -.1, -1.25, -20, 20);
EntityEventRegister_scr(id, EVENTS_FIRE_WEAPON, WeaponEjectCasing_scr, args);
WeaponSetProjectileAttribute_scr(id, projectileTest_obj, PROJ_ATTR_SPEED_START, 17);


