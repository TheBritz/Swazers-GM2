/// @description Collision Check
//var hit = instance_place(x, y, entityCombatantEnemy_obj);
var hit = noone;
if(instance_exists(hit))
{
  //Handle prime collision
  
}
else
{
  //Collision Check against shadow enemies
  //hit = instance_place(x, y, entityCombatantEnemyShadow_obj);
  if(instance_exists(hit))
  {
    //Handle shadow collision
    
  }
}

///Inherited Events
event_inherited();

