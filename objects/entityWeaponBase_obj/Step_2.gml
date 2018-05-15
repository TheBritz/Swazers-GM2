/// @description Ancestor events
event_inherited();

///Decrement fire timer and fire logic
m_fireTimer -= global.timeSpeed;

if(Weapon_IsShootable_scr(id))
{  
  //May need to set burst counter
  if(m_ammoBurstCounter <= 0 && m_ammoBurstValue > 0)
  {
    m_ammoBurstCounter = m_ammoBurstValue;
  }

  //Fire weapon
  var clipIndex = WeaponGetClipIndex_scr(id);
  if(clipIndex >= 0)
  {
    var projType = ammoClip[|clipIndex];
    ds_list_delete(ammoClip, clipIndex);
    var projAttr, fScript, fArgs, fRate;
    if(ds_map_exists(m_ammoProjAttributes, projType))
    {
      projAttr = m_ammoProjAttributes[?projType];
      //Get the fire script if it's in the m_ammoProjAttributes
      if(ds_map_exists(projAttr, PROJ_ATTR_FIRE_SCRIPT)) 
      {
        fScript = projAttr[?PROJ_ATTR_FIRE_SCRIPT];
      }
      //Otherwise, get the script from the fireScript member
      else
      {
        fScript = fireScript;
      }
      
      //Get the fire script args if they're in the attributes
      if(ds_map_exists(projAttr, PROJ_ATTR_FIRE_ARGS))
      {
        fArgs = projAttr[?PROJ_ATTR_FIRE_ARGS];  
      }
      //Otherwise, get the args from the fireArgs member
      else
      {
        fArgs = fireArgs;
      }   
      
      if(--m_ammoBurstCounter > 0)
      { 
        //Get the fire rate if it's in the attributes
        if(ds_map_exists(projAttr, PROJ_ATTR_ROF_BURST))
        {
          fRate = projAttr[?PROJ_ATTR_ROF_BURST];  
        }
        //Otherwise, get the args from the fireArgs member
        else
        {
          fRate = m_fireRateBurst;
        }
      }
      else
      {
        //Get the fire rate if it's in the attributes
        if(ds_map_exists(projAttr, PROJ_ATTR_ROF))
        {
          fRate = projAttr[?PROJ_ATTR_ROF];  
        }
        //Otherwise, get the args from the fireArgs member
        else
        {
          fRate = fireRate;
        }
      }   
    }
    else
    {
      //No projectile attribute map, use the weapon members
      fScript = fireScript;
      fArgs = fireArgs;
      if(--m_ammoBurstCounter > 0)
      {
        fRate = m_fireRateBurst;
      }
      else
      {
        fRate = fireRate;
      }
    }
    
    //Run the fire script - the first argument will always be the projectile 
    //type, the second argument is the custom argument array
    script_execute(fScript, projType, fArgs);
    
    //Run the fire event
    EntityEventFire_scr(id, EVENTS_FIRE_WEAPON);
    
    
    
    //If the new clipIndex is -1 then we've just fired our last round, run
    //the ammo depleted events
    if(WeaponGetClipIndex_scr(id) == -1)
    {
      EntityEventFire_scr(id, EVENTS_AMMO_DEPLETED);
    } 
    
    //Set the fire timer to the fire rate value
    m_fireTimer = fRate;
    
    //Check to see if there's a fire sprite
    if(!is_undefined(m_spriteFire))
    {
      var animSpd;
      if(is_undefined(m_animationSpeedFire))
      {
        //Calculate animation speed
        animSpd = sprite_get_number(m_spriteFire)/fRate;
      }
      else
      {
        animSpd = m_animationSpeedFire;
      }
      sprite_index = m_spriteFire;
      image_index = 0;
      image_speed = animSpd; 
      m_imageSpeedRaw = animSpd;
    }
  } 
}

///Decrement reload timer
ammoReloadTimer -= global.timeSpeed;

if(ammoReloadTimer <= 0 && m_ammoIsReloading)
{
  //Magazine capacity is passed in to reload script
  script_execute(ammoReloadScript, WeaponGetClipCapacity_scr(id), ammoReloadArgs);
  EntityEventFire_scr(id, EVENTS_RELOAD_END);
  m_ammoIsReloading = false;
}


///Set sprite scale sign
if(image_angle <= 90 || image_angle >= 270)
{
  image_yscale = abs(image_yscale);
}
else
{
  image_yscale = -abs(image_yscale);
}

