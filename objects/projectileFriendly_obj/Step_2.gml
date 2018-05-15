/// @description Ancestor Events
event_inherited();

///Basic Enemy Collision Checking
if(!m_suppressBasicCollision)
{
  var hit = instance_place(x, y, entityCombatantEnemy_obj);
  
  if(instance_exists(hit))
  {
    EntityEventFire_scr(id, EVENTS_PROJ_HIT);  
    
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
}

///Basic Wall collision checking

if(!m_suppressBasicWallCollision)
{
  //Use line collision from previous point to current point
  var hit = collision_line
    (xprevious, yprevious, x, y, environmentWall_obj, true, false);
  
  //TODO: Make a collision_line_list function and make sure bullet hits the first
  //wall it comes to (current implmentation could result in hitting a wall it
  //shouldn't have). 
  if(instance_exists(hit))
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

