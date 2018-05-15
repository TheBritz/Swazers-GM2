/// @description Ancestor events
event_inherited();

///Monitor bounce
//Vertical Bounce
if(m_z == 0)
{
  if(abs(m_zSpeed) < 1)
  {
    rotationSpeed = 0;
    if(abs(speed) <= 0)
    {
      part_type_orientation(m_partType, image_angle, image_angle, 0, 0, false);
      part_particles_create(global.CasingPartSystem, x, y, m_partType, 1);
      instance_destroy();
    }
  }
}

//Wall Bounce
if(abs(speed) > 0)
{
  var hit = instance_place(x, y, environmentWall_obj);
  if(instance_exists(hit))
  {
    var xScaleHolder = image_xscale;
    if(bbox_right - bbox_left < 12)
    {
      image_xscale *= 2;
    }
    
    var yScaleHolder = image_yscale;
    if(bbox_bottom - bbox_top < 12)
    {
      image_yscale *= 2; 
    } 
    
    var angle = EntityCombatantGetWallCollisionDirection_scr(id, hit);
    image_xscale = xScaleHolder;
    image_yscale = yScaleHolder;
    if(!is_undefined(angle))
    {
      var diff = angle_difference(direction, angle);
      direction += 180;
      direction += diff * -2;
      speed *= m_bounceCoef;
      var loop = true;
      var xx, yy;
      var moveInc = 3;
      while(loop)
      {
        xx = lengthdir_x(moveInc, direction);
        x += xx;
        yy = lengthdir_y(moveInc, direction);
        y += yy;
        if(!place_meeting(x, y, hit))
        {
          break;
        }
      }
    }
  }
}


