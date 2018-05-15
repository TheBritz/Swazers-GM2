/// @description Init
event_inherited();
fireRate = 8;
fireScript = FireTest_scr;
fireDispersion = array(-5,5);
muzzleOrigin = array(35, -6);
m_ammoClipSize = 20;
ammoProjectileTypes[|0] = projectileTest_obj;
WeaponReloadBasic_scr(WeaponGetClipCapacity_scr(id));
var args = array(casing_obj, -2.5, -.1, -.75, .75, -1, -3.5, -20, 20);
EntityEventRegister_scr(id, EVENTS_FIRE_WEAPON, WeaponEjectCasing_scr, args);

