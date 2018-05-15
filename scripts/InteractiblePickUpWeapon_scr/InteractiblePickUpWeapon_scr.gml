/// @description InteractiblePickUpWeapon_scr(interactorInstance, interactArgs)
/// @param interactorInstance
/// @param  interactArgs

var interactor = argument0;
var args = argument1;

if(!is_undefined(m_weaponHeld) && m_weaponHeld != -1)
{
  var wep = instance_create(x, y, m_weaponHeld);
  wep.combatant = interactor;
  
  with(interactor)
  {
    if(m_weaponsActiveIndex < ds_list_size(m_weapons) - 1)
    {
      //Insert this weapon directly after the currently-equiped weapon
      ds_list_insert(m_weapons, m_weaponsActiveIndex + 1, wep);
    }
    else
    {
      //Add to the end 
      ds_list_add(m_weapons, wep);
    }
    
    //If the combatant is set to switch to the weapon that's been picked up,
    //change primary weapon to the one that was just picked up
    if(m_weaponPickupAutoSwitch)
    {
      CombatantSetActiveWeapon_scr(id, wep, 0);
    }
    else
    {
      instance_deactivate_object(wep);
    }
  }
  
  //The interactible instance is in focus - since it is being picked up,
  //it needs to be destroyed
  instance_destroy();
}
