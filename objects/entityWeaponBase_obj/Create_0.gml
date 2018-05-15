/// @description Weapon init
event_inherited();

enum WeaponFireType
{
  Auto,
  SemiAuto
}

//Temporary, this will eventually go in projectile attributes
m_muzzleFlash = undefined;

m_fireType = WeaponFireType.Auto;

m_drawShadow = false;
m_handPrimary = undefined;
m_handSecondary = undefined;
m_autoDepthType = EntityAutoDepthType.None;

fireScript = undefined;

ammoClip = ds_list_create();
m_ammoClipSize = 0;
ammoMax = 0;
ammoCurrent = 0;
ammoClipCurrent = 0;
ammoReloadTimer = 0;
m_ammoReloadRate = 0;
ammoReloadScript = WeaponReloadBasic_scr;
ammoReloadArgs = undefined;
m_ammoIsReloading = false;
ammoProjectileTypes = ds_list_create();
ammoMuzzleFlashes = ds_map_create();
ammoProjNumber = undefined;
m_ammoProjDamage = undefined;
ammoProjSpeedStart = undefined;
ammoProjSpeedMax = undefined;
m_ammoLastProjType = undefined;

m_ammoBurstValue = 0;
m_ammoBurstCounter = 0;

//Multipliers
m_ammoClipSizeModMult = 0;
m_ammoClipSizeModPlus = 0;
m_ammoReloadRateModMult = 0;
m_ammoReloadRateModPlus = 0;
m_projSpeedStartModMult = 0;
m_projSpeedStartModPlus = 0;
m_projSpeedMaxModMult = 0;
m_projSpeedMaxModPlus = 0;
m_projDamageModMult = 0;
m_projDamageModPlus = 0;

//Projectile attribute map - these will override attributes in the projectile
//but not those in the m_ammoProjAttributes map
m_ammoProjAttributesDefault = ds_map_create();

//m_ammoProjAttributes stores attribute maps against the projectile
//object index. This is how the weapon can effect the attributes
//of the specifc projectiles it fires. It will override any other attributes
//that would otherwise apply for that specific projectile
m_ammoProjAttributes = ds_map_create();

//Reference to the combatant object using this weapon
combatant = noone;

//Fire attributes
fireDispersion = WeaponCreateFireDispersionArray_scr(0, 0);
fireMuzzleOrigin = WeaponCreateMuzzleOriginArray_scr(0, 0);
m_fireTimer = -1;
fireRate = -1;
m_fireRateBurst = -1;
//Script used when weapon is fired
fireScript = undefined;
fireArgs = undefined;

//Coordinate array for the relative position of the muzzle
//(where projectiles will appear when shot)
fireMuzzleOrigin = WeaponCreateMuzzleOriginArray_scr(0, 0);
m_casingEjectOrigin = WeaponCreateMuzzleOriginArray_scr(0, 0);
m_clipEjectOrigin = WeaponCreateMuzzleOriginArray_scr(0, 0);

//Get the interactible object index for this weapon 
var weaponName = object_get_name(object_index);
var interactibleName = string_replace(weaponName, "entity", "interactible");
m_weaponInteractible = asset_get_index(weaponName);

//Sprite types
m_spriteIdle = sprite_index;
m_animationSpeedIdle = 0;
m_spriteFire = undefined;
m_animationSpeedFire = undefined;
m_spriteReload = undefined;
m_animationSpeedReload = undefined;

