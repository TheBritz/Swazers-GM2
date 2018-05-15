/// @description interactibleBasicWeapon_obj init
event_inherited();

m_interactScript = InteractiblePickUpWeapon_scr;

//Member variable that holds the object index for the held weapon that this
//interactible represents
m_weaponHeld = undefined;

//Try to get the held weapon index
var interactibleName = object_get_name(object_index);
var weaponName = string_replace(interactibleName, "interactible", "entity");
m_weaponHeld = asset_get_index(weaponName);

//Try to get the held weapon's sprite
if(m_weaponHeld != -1)
{
  sprite_index = object_get_sprite(m_weaponHeld);
}

var newSprite = sprite_duplicate(sprite_index);
sprite_index = newSprite;
var w = sprite_get_width(newSprite);
var h = sprite_get_height(newSprite);
sprite_set_offset(newSprite, w/2, h/2);  

