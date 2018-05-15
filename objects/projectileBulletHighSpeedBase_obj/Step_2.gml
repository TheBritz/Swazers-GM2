/// @description High-speed bullet collision
/*
var coordsPrevious = m_coordsPrevious[|0];
var dist = point_distance(coordsPrevious[0], coordsPrevious[1], x, y);
if(dist > 0)
{
  var tempMask = mask_index;
  mask_index = projectileLaserBeam_spr;
  var w = sprite_get_width(mask_index);
  var tempXScale = image_xscale;
  image_xscale = dist/w;
  
  //Get collisions with enemies
  var list = instance_place_list
    (xprevious, yprevious, entityCombatantEnemy_obj, 1000, false);
  //Add in collisions with walls
  instance_place_list
    (xprevious, yprevious, environmentWall_obj, 1000, false, list);
  //Sort hits by proximity
  sort_list_by_distance(xprevious, yprevious, list);
  
  //TODO: Incorporate pierce
  var hit = list[|0];
  
  if(!is_undefined(hit) && instance_exists(hit))
  {
    //Adjust final bullet position
    var length = sprite_get_width(sprite_index);
    var dist = point_distance(coordsPrevious[0], coordsPrevious[1], hit.x, hit.y)
    image_xscale = dist / length;
    var i = 0;
    var loop = true;
    while(loop)
    {
      loop = place_meeting(coordsPrevious[0], coordsPrevious[1], hit);
      image_xscale--;
    }
    image_xscale++;
    var finalDist = image_xscale * length;
    
    //Get impact position
    var xx = lengthdir_x(finalDist, direction);
    var yy = lengthdir_y(finalDist, direction);
    x = coordsPrevious[0] + xx;
    y = coordsPrevious[1] + yy;
    
    if(object_is(hit.object_index, entityCombatantEnemy_obj))
    {
      with(hit)
      {
        m_hp -= other.m_damage;
        motion_add(other.direction, 5);
        if(m_hp <= 0)
        {
          //Kill enemy
          instance_destroy();
          var wep = other.m_weapon;
          if(instance_exists(wep))
          {
            //Run event for weapon killing
            EntityEventFire_scr(wep, EVENTS_KILL);
            if(instance_exists(wep.combatant))
            {
              //Run event for combatant killing
              EntityEventFire_scr(wep.combatant, EVENTS_KILL);          
            }
          }
        }
      }
      
      //Decrement this projectile's number of pierces
      pierceNumber--;
      if(pierceNumber == 0)
      {
        //No pierces left; create an impact and destroy this projectile
        ProjImpact_scr(x, y, impactHitEntity_obj, depth, 0);
        instance_destroy();
      }
    }
    if(object_is(hit.object_index, environmentWall_obj))
    {
      ProjImpact_scr(x, y, impactHitWall_obj, depth, hit.image_angle);
        
      //Create and fill the argument list
      var args = ds_list_create();
      ds_list_add(args, netID, x, y, impactHitWall_obj, depth, hit.image_angle);
      
      //Create the script execute buffer
      var buff = NetMsgWriteScriptExecute_scr(RemoteScriptProjImpact_scr, args);
      ds_list_destroy(args);
      
      //Distribute message
      ClientSessionDistributeMessageToPeers_scr(buff);
      buffer_delete(buff);
      
      instance_destroy();
    }
  }
  
  mask_index = tempMask;
  image_xscale = tempXScale;
}

/* */
///Ancestor Events
event_inherited();

/* */
///High-speed bullet collision alt
var coordsPrevious = m_coordsPrevious[|0];
var dist = point_distance(coordsPrevious[0], coordsPrevious[1], x, y);
if(dist > 0)
{
  var stepNumber = ceil(dist/m_stepSize);
  var stepX = lengthdir_x(m_stepSize, direction);
  var stepY = lengthdir_y(m_stepSize, direction);
  xx = coordsPrevious[0];
  yy = coordsPrevious[1];
  
  for(var i = 0; i < stepNumber; i++)
  {
    if(i == stepNumber - 1)
    {
      xx = x;
      yy = y;
    }
    
    var hit = instance_place(xx, yy, entityCombatantEnemy_obj);
    if(instance_exists(hit))
    {
      with(hit)
      {
        m_hp -= other.m_damage;
        motion_add(other.direction, 5);
        if(m_hp <= 0)
        {
          //Kill enemy
          m_destroyMe = true;
          var wep = other.m_weapon;
          if(instance_exists(wep))
          {
            //Run event for weapon killing
            EntityEventFire_scr(wep, EVENTS_KILL);
            if(instance_exists(wep.combatant))
            {
              //Run event for combatant killing
              EntityEventFire_scr(wep.combatant, EVENTS_KILL);          
            }
          }
        }
      }
      
      //Decrement this projectile's number of pierces
      pierceNumber--;
      if(pierceNumber == 0)
      {
        //No pierces left; create an impact and destroy this projectile
        ProjImpact_scr(xx, yy, impactHitEntity_obj, depth, 0);
        instance_destroy();
        break;
      }
    }
    
    hit = instance_place(xx, yy, environmentWall_obj);
    if(instance_exists(hit))
    {
      x = xx;
      y = yy;
      ProjImpact_scr(xx, yy, impactHitWall_obj, depth, hit.image_angle);
        
      //Create and fill the argument list
      var args = ds_list_create();
      ds_list_add(args, netID, xx, yy, impactHitWall_obj, depth, hit.image_angle);
      
      //Create the script execute buffer
      var buff = NetMsgWriteScriptExecute_scr(RemoteScriptProjImpact_scr, args);
      ds_list_destroy(args);
      
      //Distribute message
      ClientSessionDistributeMessageToPeers_scr(buff);
      buffer_delete(buff);
      
      m_destroyMe = true;
      break;
    }
    
    xx += stepX;
    yy += stepY;
  }
}

/* */
/*  */
