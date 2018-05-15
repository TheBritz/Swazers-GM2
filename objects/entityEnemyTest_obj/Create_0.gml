/// @description Test Enemy Init
event_inherited();

m_hp = 5;
EntitySetImageSpeed_scr(id, .15);

movementMask = enemyTestMovement_spr;
combatMask = sprite_index;

//Proximity checking
aiActivateCheckTime = 5;
alarm[0] = 5;
aiActivateDist = 1000;

//Combat
m_target = noone;

//AI activity list
aiStateList = ds_list_create();
aiState = AI_STATE_IDLE;

//Movement
speedMax = 1.5;
deccel = .01;
accel = .01;

//Weapon
var wepTest = instance_create(x, y, entityWeaponBaddieTest_obj);
wepTest.combatant = id;
ds_list_add(m_weapons, wepTest);
m_weaponsActiveCount = 1;

