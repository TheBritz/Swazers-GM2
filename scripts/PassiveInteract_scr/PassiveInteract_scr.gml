/// @description PassiveInteract_scr(interactor, interactArgs)
/// @param interactor
/// @param  interactArgs

var interactor = argument0;
var interactible = argument1;

//Execute the pickup script
script_execute(interactible.m_pickupOrDropScript, interactor, 1);

//Add the item to the passive list
ds_list_add(interactor.m_passiveList, object_index);
with(interactible)
{
  instance_destroy();
}
