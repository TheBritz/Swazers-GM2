/// @description ineractibleBase_obj init
event_inherited();

//When the player interacts with an interactible object, the script stored in
//the m_interactScript is executed, passing the m_interactArgs in
m_interactScript = undefined;
m_interactArgs = undefined;

//The m_spriteHighlight will be drawn over top of the sprite index 
m_spriteHighlight = undefined;

//Highlights list - list of the player entities that are in interacting range
m_highlighterList = ds_list_create();

//Try to get the highlight sprite index
var spriteName = sprite_get_name(sprite_index);
spriteName = string_replace(spriteName, "_spr", "Highlight_spr");
m_spriteHighlight = asset_get_index(spriteName);

