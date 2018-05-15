/// @description Player 1 test init
event_inherited();

//Create stat display
var statDisp = instance_create(x, y, playerStatDisplay_obj);
statDisp.m_playerInstance = id;

//var wepTest = instance_create(x, y, entityWeaponTheWatcher_obj);
//wepTest.combatant = id;
//ds_list_add(weapons, wepTest);
m_weaponsActiveCount = 1;
m_drawAmmoStartX = window_get_width() * .01;
m_drawAmmoStartY = window_get_height() * .1;
m_drawAmmoMargin = 2;
m_drawAmmoDirection = 1;

m_drawHealthStartX = window_get_width() * .01;
m_drawHealthStartY = window_get_width() * .01;
m_drawHealthMargin = 8;
m_drawAmmoDirection = 1;

movementMask = playerPlaceholder_spr;
combatMask = playerCombatMask_spr;


