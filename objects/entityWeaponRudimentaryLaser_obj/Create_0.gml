/// @description Init
event_inherited();
fireRate = 14;
fireScript = FireTest_scr;
WeaponSetProjectileAttribute_scr
  (id, projectileLaserBeamBase_obj, PROJ_ATTR_SPEED_START, 0);
WeaponSetProjectileAttribute_scr
  (id, projectileLaserBeamBase_obj, PROJ_ATTR_SPEED_MAX, 0);  
m_ammoReloadRate = room_speed*2;

ammoProjNumber = 1;
fireDispersion = WeaponCreateFireDispersionArray_scr(-3, 3);
fireMuzzleOrigin = WeaponCreateMuzzleOriginArray_scr(35, -3);
m_casingEjectOrigin = WeaponCreateMuzzleOriginArray_scr(15, -3);
var args = array(clip_obj, -1.75, -.25, -.4, .4, -.1, -1.25, -6, 6);
EntityEventRegister_scr(id, EVENTS_RELOAD_START, WeaponEjectCasing_scr, args);
EntityEventRegister_scr(id, EVENTS_RELOAD_START, WeaponReloadStart_scr, args);
EntityEventRegister_scr(id, EVENTS_RELOAD_END, WeaponReloadEnd_scr, args);
m_ammoClipSize = 12;
ammoProjectileTypes[| 0] = projectileLaserBeamBase_obj;
WeaponReloadBasic_scr(WeaponGetClipCapacity_scr(id));



