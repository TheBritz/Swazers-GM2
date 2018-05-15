/// @description Init
event_inherited();
fireRate = 2;
fireScript = FireTest_scr;
m_ammoReloadRate = room_speed*2;

ammoProjNumber = 1;
m_casingEjectOrigin = WeaponCreateMuzzleOriginArray_scr(7, 22);
fireDispersion = WeaponCreateFireDispersionArray_scr(-6, 6);
fireMuzzleOrigin = WeaponCreateMuzzleOriginArray_scr(54, 20);
m_ammoClipSize = 300;
ammoProjectileTypes[|0] = projectileTest_obj;
WeaponReloadBasic_scr(WeaponGetClipCapacity_scr(id));
var args = array(casingBig_obj, -1.75, -.05, -.4, .4, -.1, -1.25, -20, 20);
EntityEventRegister_scr(id, EVENTS_FIRE_WEAPON, WeaponEjectCasing_scr, args);



