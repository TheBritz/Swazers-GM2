/// @description Init
event_inherited();

m_handSecondary = array(20, -1);
m_handPrimary = array(-3, 8);

fireDispersion = WeaponCreateFireDispersionArray_scr(-8, 8);
fireRate = 12;
fireScript = FireTest_scr;
fireMuzzleOrigin = array(50, -5);
m_ammoClipSize = 20;
ammoProjNumber = 6;
ammoProjectileTypes[|0] = projectileShotgunPellet_obj;
WeaponReloadBasic_scr(WeaponGetClipCapacity_scr(id));
AmmoAddDisplaySpriteToMap_scr
  (projectileShotgunPellet_obj, ammoBasicShotgunShell_spr);
m_casingEjectOrigin = WeaponCreateMuzzleOriginArray_scr(7, -7);
var args = array(casingShotgun_obj, -1.75, -.05, -.4, .4, -.1, -1.25, -20, 20);
EntityEventRegister_scr(id, EVENTS_FIRE_WEAPON, WeaponEjectCasing_scr, args);
m_ammoReloadRate = room_speed*2.25;

