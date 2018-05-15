/// @description Draw Empty Text

if(ds_list_size(ammoClip) <= 0 || m_ammoIsReloading)
{
  if(instance_exists(combatant) && 
  object_is(combatant.object_index, playerBase_obj))
  { 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var text;
    if(m_ammoIsReloading)
    {
      text = "Reloading...";
    }
    else
    {
      text = "Empty";
    }  
      
    draw_text_colour(combatant.x, combatant.y - 80, string_hash_to_newline(text), c_white, c_white, c_white, c_white, 1);
  }
}

