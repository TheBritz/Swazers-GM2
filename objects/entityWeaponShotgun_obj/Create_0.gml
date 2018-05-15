/// @description Init
event_inherited();

m_handSecondary = array(20, -1);
m_handPrimary = array(-3, 8);

fireDispersion = WeaponCreateFireDispersionArray_scr(-7, 7);
fireRate = 24;
fireScript = FireTest_scr;
fireMuzzleOrigin = array(35, -5);
m_ammoClipSize = 8;
ammoProjNumber = 8;
ammoProjectileTypes[|0] = projectileShotgunPellet_obj;
WeaponReloadBasic_scr(WeaponGetClipCapacity_scr(id));
AmmoAddDisplaySpriteToMap_scr
  (projectileShotgunPellet_obj, ammoBasicShotgunShell_spr);
m_ammoReloadRate = room_speed*2;

