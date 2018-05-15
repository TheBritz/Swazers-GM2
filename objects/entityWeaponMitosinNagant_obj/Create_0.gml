/// @description Init
event_inherited();
fireRate = room_speed * .75;
fireScript = FireTest_scr;
m_ammoReloadRate = room_speed*1.25;

ammoProjNumber = 1;
m_casingEjectOrigin = WeaponCreateMuzzleOriginArray_scr(7, -3);
fireDispersion = WeaponCreateFireDispersionArray_scr(0, 0);
fireMuzzleOrigin = WeaponCreateMuzzleOriginArray_scr(68, -3);
m_ammoClipSize = 5;
ammoProjectileTypes[|0] = projectileHighSpeedTest_obj;
WeaponReloadBasic_scr(WeaponGetClipCapacity_scr(id));
m_spriteFire = weaponMitosinNagantFire_spr;

var args = array(casingRifle_obj, -1.75, -.05, -.4, .4, -.1, -1.25, -12, 12);
EntityAnimationEventRegister_scr(id, m_spriteFire, 5, WeaponEjectCasing_scr, args);

