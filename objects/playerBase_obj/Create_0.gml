/// @description Player Init
event_inherited();

//Hitter mask will be used for wall collision
mask_index = playerPlaceholder_spr;
Collidable_SetHitterMask_scr(id, playerPlaceholder_spr);

//Acceleration
m_accelKbd = .7;
m_accelGpd = .7;
m_gpdAxisH = undefined;
m_gpdAxisV = undefined;

//Deadzone
m_deadzoneStatic = .2;
m_deadzoneKinetic = .05;

m_hands = instance_create(x, y, playerHands_obj);
m_handSprites = ds_list_create();
ds_list_add(m_handSprites, playerHandPrimary_spr, playerHandSecondary_spr);

PlayerInitEventsMap_scr();
m_playerIndex = undefined;
kbdControl = false;

//Weapon Modifiers
m_ammoClipSizeModMult = 0;
m_ammoClipSizeModPlus = 0;

//Interactible members
m_interactible = noone;
m_interactRange = 48;
m_interactPressTimer = 0;
m_interactRunPressTimer = false;
m_interactSwitchTimer = room_speed/2;
m_interactHighlightColor = c_white;

//Item lists
m_passiveList = ds_list_create();
m_activeList = ds_list_create();

//HUD drawing - ammo
m_drawAmmoStartX = undefined;
m_drawAmmoStartY = undefined;
m_drawAmmoMargin = undefined;
m_drawAmmoDirection = undefined;

//HUD drawing - health
m_drawHealthStartX = undefined;
m_drawHealthStartY = undefined;
m_drawHealthMargin = undefined;
m_drawAmmoDirection = undefined;

m_combatantCollisionRate = 1;

//Player moving member variables - these are needed because the player can use
//keyboard controls. Normally the base entity class will take care of slowing
//when the entity is not actively moving, but keyboard controls mean that the
//movement is separated by vertical and horizontal axis. A player that stops
//pressing the up key needs to deccelerate in the up direction even if they are
//still moving because they are holding the move right key.
m_movingHor = undefined;
m_movingVert = undefined;

