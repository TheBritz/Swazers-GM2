/// @description Ancestor Events
event_inherited();

///Control Fading
if(m_beamFadeType == BEAM_FADE_TYPE_ALPHA)
{
  image_alpha -= m_beamFadeRate;
  if(image_alpha <= 0)
  {
    instance_destroy();
  }
}
else if(m_beamFadeType == BEAM_FADE_TYPE_SCALE)
{
  image_yscale -= m_beamFadeRate;
  if(image_yscale <= 0)
  {
    instance_destroy();
  }
}

///Beam laser collision
if(m_hits > 0)
{
  image_xscale = 1000;
  
  //Build the hit list
  var hitList = instance_place_list(x, y, entityCombatantEnemy_obj, 1000);
  instance_place_list(x, y, entityCombatantEnemyShadow_obj, 1000, false, hitList);
  instance_place_list(x, y, environmentWall_obj, 1000, false, hitList);
  
  if(ds_list_size(hitList) > 0)
  {
    m_hits--;  
  }
  
  //Find the closest hit
  var closestDistance, closestInstance, instance, distance;
  closestDistance = 10000000;
  closestInstance = noone;
  for(var i = 0; i < ds_list_size(hitList); i++)
  {
    instance = hitList[| i];
    distance = point_distance(x, y, instance.x, instance.y); 
    if(distance < closestDistance)
    {
      closestDistance = distance;
      closestInstance = instance;
    }
  }
  
  //Adjust laser length to the hit instance
  var length = sprite_get_width(sprite_index);
  image_xscale = closestDistance / length;
  var i = 0;
  var loop = true;
  while(loop)
  {
    loop = place_meeting(x, y, closestInstance);
    image_xscale--;
  }
  image_xscale += 5;
  var finalDist = image_xscale * length;
  
  //Get impact position
  var xx = lengthdir_x(finalDist, image_angle);
  var yy = lengthdir_y(finalDist, image_angle);
  xx += x;
  yy += y;
  var leastDepth = depth;
  if(closestInstance.depth < leastDepth)
  {
    leastDepth = closestInstance.depth;
  }
  ProjImpact_scr(xx, yy, impactHitWall_obj, leastDepth - 1, image_angle);
  m_impactPosX = xx;
  m_impactPosY = yy;
}




