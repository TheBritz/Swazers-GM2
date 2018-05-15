var projType = argument[0];

var projNum, fDisp, muzzOrigin, dmg, spdStart, spdMax;

//Our null case is that we're using the weapon members
projNum = ammoProjNumber;
fDisp = fireDispersion;
muzzOrigin = fireMuzzleOrigin;
dmg = m_ammoProjDamage;
spdStart = ammoProjSpeedStart;
spdMax = ammoProjSpeedMax;

//If there's an attribute map for this projectile type, use it
if(ds_map_exists(m_ammoProjAttributes, projType))
{
  var projAttr = m_ammoProjAttributes[?projType];
  //If we have a projNumber attribute, use it
  if(ds_map_exists(projAttr, PROJ_ATTR_NUMBER))
  {
    projNum = projAttr[?PROJ_ATTR_NUMBER];  
  }
  
  //If we have a dispersion array attribute, use it
  if(ds_map_exists(projAttr, PROJ_ATTR_DISPERSION))
  {
    dispArr = projAttr[?PROJ_ATTR_DISPERSION];
  }
  
  //If we have muzzle coordinates, use them
  if(ds_map_exists(projAttr, PROJ_ATTR_MUZZLE_ORIGIN))
  {
    muzzCoords = projAttr[?PROJ_ATTR_MUZZLE_ORIGIN];
  }
  
  //If we have a start speed attribute, use it
  if(ds_map_exists(projAttr, PROJ_ATTR_SPEED_START))
  {
    spdStart = projAttr[?PROJ_ATTR_SPEED_START];
  }
  
  //If we have a max speed attribute, use it
  if(ds_map_exists(projAttr, PROJ_ATTR_SPEED_MAX))
  {
    spdMax = projAttr[?PROJ_ATTR_SPEED_MAX];
  }
}

var muzzleCoords = relative_coordinates
  (x, y, muzzOrigin[0], muzzOrigin[1]*sign(image_yscale), image_angle);

//Create a muzzle flash
if(!is_undefined(m_muzzleFlash))
{
  var flash = instance_create(muzzleCoords[0], muzzleCoords[1], m_muzzleFlash);
  flash.image_angle = image_angle;
  if(image_angle > 90 && image_angle < 270)
  {
    flash.image_yscale = -1;
  }
}
  
repeat(projNum)
{      
  var proj = instance_create(muzzleCoords[0], muzzleCoords[1], projType);
  proj.m_weapon = id;
  //Register an event
  EntityEventRegister_scr
    (proj, EVENTS_PROJ_HIT, ProjHitEvent_scr, array("blerp", "bleep", "bloop"));
  var disp = random_range(fDisp[0], fDisp[1]);
  proj.image_angle = image_angle + disp;
  proj.direction = proj.image_angle;
  //The following values could be undefined if it's intended for the 
  //projectile object to set these.
  if(!is_undefined(spdStart)) proj.speed = spdStart;
  if(!is_undefined(spdMax)) proj.speedMax = spdMax;
  if(!is_undefined(dmg)) proj.m_damage = dmg;
  //Apply the basic projectile modifiers
  ProjApplyModifiers_scr(proj);
}



