/// @description Init
event_inherited();

m_interactScript = PassiveInteract_scr;
m_interactArgs = id;

//Get the associated sprite and pickupOrDrop script if they exist
var objectName = object_get_name(object_index);
var spriteName = string_replace(objectName, "_obj", "_spr");
var spriteIndex = asset_get_index(spriteName);
if(spriteIndex >= 0)
{
  sprite_index = spriteIndex;  
}

m_pickupOrDropScript = undefined;
var scriptName = string_replace(objectName, "passive", "Passive");
var scriptName = string_replace(scriptName, "_obj", "_scr");
var scriptIndex = asset_get_index(scriptName);
if(scriptIndex >= 0)
{
  m_pickupOrDropScript = scriptIndex;
}

