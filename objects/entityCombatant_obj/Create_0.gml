/// @description Combatant init
event_inherited();

CombatantInitEventsMap_scr();

m_autoDepthType = EntityAutoDepthType.Bottom;

//entityCombatant_obj is any object that uses a weapon
m_weapons = ds_list_create();
//Weapons that are currently being used
m_weaponsActive = ds_list_create();
//This value represents the number of weapons that can be active
m_weaponsActiveCount = 0;
//The value of the currently active weapon index
m_weaponsActiveIndex = 0;
//A series of coords that represent where a weapon can be held
weaponMounts = ds_list_create();
//A boolean indicating a trigger
m_weaponTriggerPulled = false;
m_weaponTriggerJustPulled = false;
//Weapon pickup modifier
m_weaponPickupAutoSwitch = true;


//Reload Timers
delayedActionList = ds_list_create();
//Create Events map
eventsMap = ds_map_create();
//Collision Masks
movementMask = undefined;
m_movementCoords = undefined;
combatMask = undefined;
//Hand sprites
m_handSprites = undefined;
m_hands = noone;

aimDir = 0;
aimTarget = noone;
m_moving = false;
m_moveDir = undefined;
m_pushAccel = .25;

m_hp = 0;
m_hpMax = 0;

//Combatant collision
m_combatantCollisionRate = 3;
m_combatantCollisionTimer = irandom(m_combatantCollisionRate);

//Combatant property mods
//Modifier sets are stored against Projectile classes in this map, those 
//modifiers are applied to any projectile of that type when it is fired by this
//combatant.
m_projectileClassModifiers = ds_map_create();
m_weaponClassModifiers = ds_map_create();

m_ammoClipSizeMult = 0;
m_ammoClipSizePlus = 0;
m_ammoReloadRateModMult = 0;
m_ammoReloadRateModPlus = 0;

//Test
m_angleMoveback = 0;

